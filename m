Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08C3DD570
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:13:46 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWpG-0003Ux-1b
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaR-0000il-WF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaO-0003c6-Ve
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so10846484wmb.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DGWN4y+CEHwKPlDwI5EEl9tQSUtlin5ZsMFr+XhjNFc=;
 b=B0jHqJBUKELYq5/Jq+TKUsB1AboJNEa0LfOb8lQ2zgvE3958I/gcp2AnGsiGKnKvL7
 V2ntFalmEIRLVGXYIe/cBTZg2OW8NfH3TtxrrVJJvKHi+fOgxK1tjBi2ljbhZgSU9SlS
 +bQjN2qTb+rmZ/P2khZld3qELR4FDfzFc23L9ktFY7TeserMKdMMDHLNTwOp/h+kxa3C
 Ob74hbQquBzP4km+j0w2SXwms3gSJbfCsaaKyvSdW/04GQtFGXG9HRdklUDUWMJ4jP6D
 XtUK33dAdbWW7M0gtuzPPdoHUR+7yQ8H7f8uaSA6rN0ULhKDby1Jzz6yEPdvbBWt1VWH
 wWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGWN4y+CEHwKPlDwI5EEl9tQSUtlin5ZsMFr+XhjNFc=;
 b=m/2KpJ4rjI2quzLZxFVgd8HIF9PBzPobjwSstm4tPAU6Hl8prAYbHVEZ/isOGdoNmx
 9jM4vRAxBX58ONi61SZJ04PgYOFAsLE5KAEuhRqeOo8WMVEUhLYc5RjzZ4yalSPHh9fX
 9lNkI+A0cGlC9vB4Oyoj1T1GAINDv9pmEDZ4RSkpnX4g4wFw5IZSrfYD3tmEOi8wLhB2
 jms21rfkxlMZpptPWmdxWmibDXEU22GltgFiSYRO53V6eF+e8WFr9e3OlhnHhRWt66GE
 mM/fKs9+6152Z4AQW1k1IIsc+pxKgzlhTp6Z1yE4jbMe+gf3KaWKUM6UvAbRh7Ab4LET
 3nSQ==
X-Gm-Message-State: AOAM5319dE9qH1u5miyrB6A4tTYhHzZvLHjoqzgZ7HzqtADVJrBrNhrq
 NmLW1KkIYtZsGIChRN9y0qAzDOc47/aadg==
X-Google-Smtp-Source: ABdhPJyviY1DRYJHYyLe3x7WftM7GLaD2QvTFaQgjvZCRn9esorNXO+NEILDXS93g1hwq2CH3gdZSw==
X-Received: by 2002:a1c:cc1a:: with SMTP id h26mr16110290wmb.47.1627905503417; 
 Mon, 02 Aug 2021 04:58:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] docs/system/arm/cpu-features.rst: Format literals
 correctly
Date: Mon,  2 Aug 2021 12:58:04 +0100
Message-Id: <20210802115812.10731-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

To format a literal (generally rendered as fixed-width font),
double-backticks are required.

cpu-features.rst consistently uses single backticks when double backticks
are required; correct it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210726142338.31872-8-peter.maydell@linaro.org
---
 docs/system/arm/cpu-features.rst | 116 +++++++++++++++----------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 11dce5c6037..584eb170974 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -10,22 +10,22 @@ is the Performance Monitoring Unit (PMU).  CPU types such as the
 Cortex-A15 and the Cortex-A57, which respectively implement Arm
 architecture reference manuals ARMv7-A and ARMv8-A, may both optionally
 implement PMUs.  For example, if a user wants to use a Cortex-A15 without
-a PMU, then the `-cpu` parameter should contain `pmu=off` on the QEMU
-command line, i.e. `-cpu cortex-a15,pmu=off`.
+a PMU, then the ``-cpu`` parameter should contain ``pmu=off`` on the QEMU
+command line, i.e. ``-cpu cortex-a15,pmu=off``.
 
 As not all CPU types support all optional CPU features, then whether or
 not a CPU property exists depends on the CPU type.  For example, CPUs
 that implement the ARMv8-A architecture reference manual may optionally
 support the AArch32 CPU feature, which may be enabled by disabling the
-`aarch64` CPU property.  A CPU type such as the Cortex-A15, which does
-not implement ARMv8-A, will not have the `aarch64` CPU property.
+``aarch64`` CPU property.  A CPU type such as the Cortex-A15, which does
+not implement ARMv8-A, will not have the ``aarch64`` CPU property.
 
 QEMU's support may be limited for some CPU features, only partially
 supporting the feature or only supporting the feature under certain
-configurations.  For example, the `aarch64` CPU feature, which, when
+configurations.  For example, the ``aarch64`` CPU feature, which, when
 disabled, enables the optional AArch32 CPU feature, is only supported
 when using the KVM accelerator and when running on a host CPU type that
-supports the feature.  While `aarch64` currently only works with KVM,
+supports the feature.  While ``aarch64`` currently only works with KVM,
 it could work with TCG.  CPU features that are specific to KVM are
 prefixed with "kvm-" and are described in "KVM VCPU Features".
 
@@ -33,12 +33,12 @@ CPU Feature Probing
 ===================
 
 Determining which CPU features are available and functional for a given
-CPU type is possible with the `query-cpu-model-expansion` QMP command.
-Below are some examples where `scripts/qmp/qmp-shell` (see the top comment
+CPU type is possible with the ``query-cpu-model-expansion`` QMP command.
+Below are some examples where ``scripts/qmp/qmp-shell`` (see the top comment
 block in the script for usage) is used to issue the QMP commands.
 
-1. Determine which CPU features are available for the `max` CPU type
-   (Note, we started QEMU with qemu-system-aarch64, so `max` is
+1. Determine which CPU features are available for the ``max`` CPU type
+   (Note, we started QEMU with qemu-system-aarch64, so ``max`` is
    implementing the ARMv8-A reference manual in this case)::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
@@ -51,9 +51,9 @@ block in the script for usage) is used to issue the QMP commands.
         "sve896": true, "sve1280": true, "sve2048": true
       }}}}
 
-We see that the `max` CPU type has the `pmu`, `aarch64`, `sve`, and many
-`sve<N>` CPU features.  We also see that all the CPU features are
-enabled, as they are all `true`.  (The `sve<N>` CPU features are all
+We see that the ``max`` CPU type has the ``pmu``, ``aarch64``, ``sve``, and many
+``sve<N>`` CPU features.  We also see that all the CPU features are
+enabled, as they are all ``true``.  (The ``sve<N>`` CPU features are all
 optional SVE vector lengths (see "SVE CPU Properties").  While with TCG
 all SVE vector lengths can be supported, when KVM is in use it's more
 likely that only a few lengths will be supported, if SVE is supported at
@@ -71,9 +71,9 @@ all.)
         "sve896": true, "sve1280": true, "sve2048": true
       }}}}
 
-We see it worked, as `pmu` is now `false`.
+We see it worked, as ``pmu`` is now ``false``.
 
-(3) Let's try to disable `aarch64`, which enables the AArch32 CPU feature::
+(3) Let's try to disable ``aarch64``, which enables the AArch32 CPU feature::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"aarch64":false}}
       {"error": {
@@ -84,7 +84,7 @@ We see it worked, as `pmu` is now `false`.
 It looks like this feature is limited to a configuration we do not
 currently have.
 
-(4) Let's disable `sve` and see what happens to all the optional SVE
+(4) Let's disable ``sve`` and see what happens to all the optional SVE
     vector lengths::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"max","props":{"sve":false}}
@@ -97,14 +97,14 @@ currently have.
         "sve896": false, "sve1280": false, "sve2048": false
       }}}}
 
-As expected they are now all `false`.
+As expected they are now all ``false``.
 
 (5) Let's try probing CPU features for the Cortex-A15 CPU type::
 
       (QEMU) query-cpu-model-expansion type=full model={"name":"cortex-a15"}
       {"return": {"model": {"name": "cortex-a15", "props": {"pmu": true}}}}
 
-Only the `pmu` CPU feature is available.
+Only the ``pmu`` CPU feature is available.
 
 A note about CPU feature dependencies
 -------------------------------------
@@ -123,29 +123,29 @@ A note about CPU models and KVM
 -------------------------------
 
 Named CPU models generally do not work with KVM.  There are a few cases
-that do work, e.g. using the named CPU model `cortex-a57` with KVM on a
-seattle host, but mostly if KVM is enabled the `host` CPU type must be
+that do work, e.g. using the named CPU model ``cortex-a57`` with KVM on a
+seattle host, but mostly if KVM is enabled the ``host`` CPU type must be
 used.  This means the guest is provided all the same CPU features as the
-host CPU type has.  And, for this reason, the `host` CPU type should
+host CPU type has.  And, for this reason, the ``host`` CPU type should
 enable all CPU features that the host has by default.  Indeed it's even
 a bit strange to allow disabling CPU features that the host has when using
-the `host` CPU type, but in the absence of CPU models it's the best we can
+the ``host`` CPU type, but in the absence of CPU models it's the best we can
 do if we want to launch guests without all the host's CPU features enabled.
 
-Enabling KVM also affects the `query-cpu-model-expansion` QMP command.  The
+Enabling KVM also affects the ``query-cpu-model-expansion`` QMP command.  The
 affect is not only limited to specific features, as pointed out in example
 (3) of "CPU Feature Probing", but also to which CPU types may be expanded.
-When KVM is enabled, only the `max`, `host`, and current CPU type may be
+When KVM is enabled, only the ``max``, ``host``, and current CPU type may be
 expanded.  This restriction is necessary as it's not possible to know all
 CPU types that may work with KVM, but it does impose a small risk of users
 experiencing unexpected errors.  For example on a seattle, as mentioned
-above, the `cortex-a57` CPU type is also valid when KVM is enabled.
-Therefore a user could use the `host` CPU type for the current type, but
-then attempt to query `cortex-a57`, however that query will fail with our
+above, the ``cortex-a57`` CPU type is also valid when KVM is enabled.
+Therefore a user could use the ``host`` CPU type for the current type, but
+then attempt to query ``cortex-a57``, however that query will fail with our
 restrictions.  This shouldn't be an issue though as management layers and
-users have been preferring the `host` CPU type for use with KVM for quite
+users have been preferring the ``host`` CPU type for use with KVM for quite
 some time.  Additionally, if the KVM-enabled QEMU instance running on a
-seattle host is using the `cortex-a57` CPU type, then querying `cortex-a57`
+seattle host is using the ``cortex-a57`` CPU type, then querying ``cortex-a57``
 will work.
 
 Using CPU Features
@@ -158,12 +158,12 @@ QEMU command line with that CPU type::
   $ qemu-system-aarch64 -M virt -cpu max,pmu=off,sve=on,sve128=on,sve256=on
 
 The example above disables the PMU and enables the first two SVE vector
-lengths for the `max` CPU type.  Note, the `sve=on` isn't actually
-necessary, because, as we observed above with our probe of the `max` CPU
-type, `sve` is already on by default.  Also, based on our probe of
+lengths for the ``max`` CPU type.  Note, the ``sve=on`` isn't actually
+necessary, because, as we observed above with our probe of the ``max`` CPU
+type, ``sve`` is already on by default.  Also, based on our probe of
 defaults, it would seem we need to disable many SVE vector lengths, rather
 than only enabling the two we want.  This isn't the case, because, as
-disabling many SVE vector lengths would be quite verbose, the `sve<N>` CPU
+disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
 properties have special semantics (see "SVE CPU Property Parsing
 Semantics").
 
@@ -217,11 +217,11 @@ TCG VCPU Features
 TCG VCPU features are CPU features that are specific to TCG.
 Below is the list of TCG VCPU features and their descriptions.
 
-  pauth                    Enable or disable `FEAT_Pauth`, pointer
+  pauth                    Enable or disable ``FEAT_Pauth``, pointer
                            authentication.  By default, the feature is
-                           enabled with `-cpu max`.
+                           enabled with ``-cpu max``.
 
-  pauth-impdef             When `FEAT_Pauth` is enabled, either the
+  pauth-impdef             When ``FEAT_Pauth`` is enabled, either the
                            *impdef* (Implementation Defined) algorithm
                            is enabled or the *architected* QARMA algorithm
                            is enabled.  By default the impdef algorithm
@@ -235,49 +235,49 @@ Below is the list of TCG VCPU features and their descriptions.
 SVE CPU Properties
 ==================
 
-There are two types of SVE CPU properties: `sve` and `sve<N>`.  The first
-is used to enable or disable the entire SVE feature, just as the `pmu`
+There are two types of SVE CPU properties: ``sve`` and ``sve<N>``.  The first
+is used to enable or disable the entire SVE feature, just as the ``pmu``
 CPU property completely enables or disables the PMU.  The second type
-is used to enable or disable specific vector lengths, where `N` is the
-number of bits of the length.  The `sve<N>` CPU properties have special
+is used to enable or disable specific vector lengths, where ``N`` is the
+number of bits of the length.  The ``sve<N>`` CPU properties have special
 dependencies and constraints, see "SVE CPU Property Dependencies and
 Constraints" below.  Additionally, as we want all supported vector lengths
 to be enabled by default, then, in order to avoid overly verbose command
-lines (command lines full of `sve<N>=off`, for all `N` not wanted), we
+lines (command lines full of ``sve<N>=off``, for all ``N`` not wanted), we
 provide the parsing semantics listed in "SVE CPU Property Parsing
 Semantics".
 
 SVE CPU Property Dependencies and Constraints
 ---------------------------------------------
 
-  1) At least one vector length must be enabled when `sve` is enabled.
+  1) At least one vector length must be enabled when ``sve`` is enabled.
 
-  2) If a vector length `N` is enabled, then, when KVM is enabled, all
+  2) If a vector length ``N`` is enabled, then, when KVM is enabled, all
      smaller, host supported vector lengths must also be enabled.  If
      KVM is not enabled, then only all the smaller, power-of-two vector
      lengths must be enabled.  E.g. with KVM if the host supports all
-     vector lengths up to 512-bits (128, 256, 384, 512), then if `sve512`
+     vector lengths up to 512-bits (128, 256, 384, 512), then if ``sve512``
      is enabled, the 128-bit vector length, 256-bit vector length, and
      384-bit vector length must also be enabled. Without KVM, the 384-bit
      vector length would not be required.
 
   3) If KVM is enabled then only vector lengths that the host CPU type
      support may be enabled.  If SVE is not supported by the host, then
-     no `sve*` properties may be enabled.
+     no ``sve*`` properties may be enabled.
 
 SVE CPU Property Parsing Semantics
 ----------------------------------
 
-  1) If SVE is disabled (`sve=off`), then which SVE vector lengths
+  1) If SVE is disabled (``sve=off``), then which SVE vector lengths
      are enabled or disabled is irrelevant to the guest, as the entire
      SVE feature is disabled and that disables all vector lengths for
-     the guest.  However QEMU will still track any `sve<N>` CPU
-     properties provided by the user.  If later an `sve=on` is provided,
-     then the guest will get only the enabled lengths.  If no `sve=on`
+     the guest.  However QEMU will still track any ``sve<N>`` CPU
+     properties provided by the user.  If later an ``sve=on`` is provided,
+     then the guest will get only the enabled lengths.  If no ``sve=on``
      is provided and there are explicitly enabled vector lengths, then
      an error is generated.
 
-  2) If SVE is enabled (`sve=on`), but no `sve<N>` CPU properties are
+  2) If SVE is enabled (``sve=on``), but no ``sve<N>`` CPU properties are
      provided, then all supported vector lengths are enabled, which when
      KVM is not in use means including the non-power-of-two lengths, and,
      when KVM is in use, it means all vector lengths supported by the host
@@ -293,7 +293,7 @@ SVE CPU Property Parsing Semantics
      constraint (2) of "SVE CPU Property Dependencies and Constraints").
 
   5) When KVM is enabled, if the host does not support SVE, then an error
-     is generated when attempting to enable any `sve*` properties (see
+     is generated when attempting to enable any ``sve*`` properties (see
      constraint (3) of "SVE CPU Property Dependencies and Constraints").
 
   6) When KVM is enabled, if the host does support SVE, then an error is
@@ -301,8 +301,8 @@ SVE CPU Property Parsing Semantics
      by the host (see constraint (3) of "SVE CPU Property Dependencies and
      Constraints").
 
-  7) If one or more `sve<N>` CPU properties are set `off`, but no `sve<N>`,
-     CPU properties are set `on`, then the specified vector lengths are
+  7) If one or more ``sve<N>`` CPU properties are set ``off``, but no ``sve<N>``,
+     CPU properties are set ``on``, then the specified vector lengths are
      disabled but the default for any unspecified lengths remains enabled.
      When KVM is not enabled, disabling a power-of-two vector length also
      disables all vector lengths larger than the power-of-two length.
@@ -310,15 +310,15 @@ SVE CPU Property Parsing Semantics
      disables all larger vector lengths (see constraint (2) of "SVE CPU
      Property Dependencies and Constraints").
 
-  8) If one or more `sve<N>` CPU properties are set to `on`, then they
+  8) If one or more ``sve<N>`` CPU properties are set to ``on``, then they
      are enabled and all unspecified lengths default to disabled, except
      for the required lengths per constraint (2) of "SVE CPU Property
      Dependencies and Constraints", which will even be auto-enabled if
      they were not explicitly enabled.
 
-  9) If SVE was disabled (`sve=off`), allowing all vector lengths to be
+  9) If SVE was disabled (``sve=off``), allowing all vector lengths to be
      explicitly disabled (i.e. avoiding the error specified in (3) of
-     "SVE CPU Property Parsing Semantics"), then if later an `sve=on` is
+     "SVE CPU Property Parsing Semantics"), then if later an ``sve=on`` is
      provided an error will be generated.  To avoid this error, one must
      enable at least one vector length prior to enabling SVE.
 
@@ -329,12 +329,12 @@ SVE CPU Property Examples
 
      $ qemu-system-aarch64 -M virt -cpu max,sve=off
 
-  2) Implicitly enable all vector lengths for the `max` CPU type::
+  2) Implicitly enable all vector lengths for the ``max`` CPU type::
 
      $ qemu-system-aarch64 -M virt -cpu max
 
   3) When KVM is enabled, implicitly enable all host CPU supported vector
-     lengths with the `host` CPU type::
+     lengths with the ``host`` CPU type::
 
      $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
 
-- 
2.20.1


