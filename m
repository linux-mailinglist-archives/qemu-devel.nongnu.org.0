Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A92F232F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 00:54:47 +0100 (CET)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz71J-0003FQ-RQ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 18:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kz6zz-0002er-2L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kz6zw-0002xd-2v
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 18:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610409199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M2FhGYGdkonUXDJ0kh851QecH1AkO16PH7+EGqaL/Lo=;
 b=Bqelp0Ef+ibrRT5tfHSi2pi8aBNW647/B8C2j655jeSPhSa9mr3FujgUalbmUHBblKUSPA
 1j3Wy5iZM+9oy5zL7+fFgXF3cSokQWihCYtMP4db29bOhvW9Mu4dga3u0NwKJOp1DkU6b6
 /h/F8K0V6MDkz7Zm0kKr8tg2NxamNIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-ApFKNQarMg-XLP9hk2ZCoQ-1; Mon, 11 Jan 2021 18:53:15 -0500
X-MC-Unique: ApFKNQarMg-XLP9hk2ZCoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E520E1005D4C;
 Mon, 11 Jan 2021 23:53:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-115-146.rdu2.redhat.com
 [10.10.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D83B84F3C6;
 Mon, 11 Jan 2021 23:53:12 +0000 (UTC)
Date: Mon, 11 Jan 2021 18:53:10 -0500
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 2/3] target/arm: Add cpu properties to control pauth
Message-ID: <20210111235310.bbeis2rh25kud2kz@kamzik.brq.redhat.com>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
 <20210111231108.461088-3-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210111231108.461088-3-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 01:11:07PM -1000, Richard Henderson wrote:
> The crypto overhead of emulating pauth can be significant for
> some workloads.  Add two boolean properties that allows the
> feature to be turned off, on with the architected algorithm,
> or on with an implementation defined algorithm.
> 
> We need two intermediate booleans to control the state while
> parsing properties lest we clobber ID_AA64ISAR1 into an invalid
> intermediate state.
> 
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use boolean properties instead of an enum (drjones).
> v3: Add tests (drjones).
> v6: Add documentation (pmm).
> ---
>  docs/system/arm/cpu-features.rst | 21 +++++++++++++++++
>  target/arm/cpu.h                 | 10 ++++++++
>  target/arm/cpu.c                 | 13 +++++++++++
>  target/arm/cpu64.c               | 40 ++++++++++++++++++++++++++++----
>  target/arm/monitor.c             |  3 ++-
>  tests/qtest/arm-cpu-features.c   | 13 +++++++++++
>  6 files changed, 95 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 35196a6b75..70e0e4ef78 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -211,6 +211,27 @@ the list of KVM VCPU features and their descriptions.
>                             influence the guest scheduler behavior and/or be
>                             exposed to the guest userspace.
>  
> +TCG VCPU Features
> +=================
> +
> +TCG VCPU features are CPU features that are specific to TCG.
> +Below is the list of TCG VCPU features and their descriptions.
> +
> +  pauth                    Enable or disable `FEAT_Pauth`, pointer
> +                           authentication.  By default, the feature is
> +                           enabled with `-cpu max`.
> +
> +  pauth-impdef             When `FEAT_Pauth` is enabled, either the
> +                           *impdef* (Implementation Definined) algorithm
> +                           is enabled or the *architected* QARMA algorithm
> +                           is enabled.  By default the impdef algorithm
> +                           is disabled, and QARMA is enabled.
> +
> +                           The architected QARMA algorithm has good
> +                           cryptographic properties, but can be quite slow
> +                           to emulate.  The impdef algorithm is
> +                           non-cryptographic but significantly faster.
> +

Doc updates look good.

>  SVE CPU Properties
>  ==================
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 70e9618d13..06f5169f45 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -197,9 +197,11 @@ typedef struct {
>  #ifdef TARGET_AARCH64
>  # define ARM_MAX_VQ    16
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> +void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>  #else
>  # define ARM_MAX_VQ    1
>  static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> +static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
>  #endif
>  
>  typedef struct ARMVectorReg {
> @@ -947,6 +949,14 @@ struct ARMCPU {
>      uint64_t reset_cbar;
>      uint32_t reset_auxcr;
>      bool reset_hivecs;
> +
> +    /*
> +     * Intermediate values used during property parsing.
> +     * Once finalized, the values should be read from ID_AA64ISAR1.
> +     */
> +    bool prop_pauth;
> +    bool prop_pauth_impdef;
> +
>      /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
>      uint32_t dcz_blocksize;
>      uint64_t rvbar;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 8387e94b94..be18df5464 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1320,6 +1320,19 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>              error_propagate(errp, local_err);
>              return;
>          }
> +
> +        /*
> +         * KVM does not support modifications to this feature.
> +         * We have not registered the cpu properties when KVM
> +         * is in use, so the user will not be able to set them.
> +         */
> +        if (!kvm_enabled()) {
> +            arm_cpu_pauth_finalize(cpu, &local_err);
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }
>      }
>  
>      if (kvm_enabled()) {
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 7cf9fc4bc6..d9feaa9cdb 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -28,6 +28,8 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
>  #include "qapi/visitor.h"
> +#include "hw/qdev-properties.h"
> +
>  
>  #ifndef CONFIG_USER_ONLY
>  static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> @@ -572,6 +574,36 @@ void aarch64_add_sve_properties(Object *obj)
>      }
>  }
>  
> +void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    int arch_val = 0, impdef_val = 0;
> +    uint64_t t;
> +
> +    /* TODO: Handle HaveEnhancedPAC, HaveEnhancedPAC2, HaveFPAC. */
> +    if (cpu->prop_pauth) {
> +        if (cpu->prop_pauth_impdef) {
> +            impdef_val = 1;
> +        } else {
> +            arch_val = 1;
> +        }
> +    } else if (cpu->prop_pauth_impdef) {
> +        error_setg(errp, "cannot enable pauth-impdef without pauth");
> +        error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
> +    }
> +
> +    t = cpu->isar.id_aa64isar1;
> +    t = FIELD_DP64(t, ID_AA64ISAR1, APA, arch_val);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, GPA, arch_val);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
> +    t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
> +    cpu->isar.id_aa64isar1 = t;
> +}
> +
> +static Property arm_cpu_pauth_property =
> +    DEFINE_PROP_BOOL("pauth", ARMCPU, prop_pauth, true);
> +static Property arm_cpu_pauth_impdef_property =
> +    DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -627,10 +659,6 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
>          t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, APA, 1); /* PAuth, architected only */
> -        t = FIELD_DP64(t, ID_AA64ISAR1, API, 0);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, GPA, 1);
> -        t = FIELD_DP64(t, ID_AA64ISAR1, GPI, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
> @@ -720,6 +748,10 @@ static void aarch64_max_initfn(Object *obj)
>          cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>          cpu->dcz_blocksize = 7; /*  512 bytes */
>  #endif
> +
> +        /* Default to PAUTH on, with the architected algorithm. */
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
>      }
>  
>      aarch64_add_sve_properties(obj);
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 198b14e95e..1fdb965eb8 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -94,7 +94,8 @@ static const char *cpu_model_advertised_features[] = {
>      "sve128", "sve256", "sve384", "sve512",
>      "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> -    "kvm-no-adjvtime", "kvm-steal-time",
> +    "kvm-no-adjvtime",

Looks like a rebase error; kvm-steal-time is getting dropped.

> +    "pauth", "pauth-impdef",
>      NULL
>  };
>  
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index bc681a95d5..8252b85bb8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -427,6 +427,18 @@ static void sve_tests_sve_off_kvm(const void *data)
>      qtest_quit(qts);
>  }
>  
> +static void pauth_tests_default(QTestState *qts, const char *cpu_type)
> +{
> +    assert_has_feature_enabled(qts, cpu_type, "pauth");
> +    assert_has_feature_disabled(qts, cpu_type, "pauth-impdef");
> +    assert_set_feature(qts, cpu_type, "pauth", false);
> +    assert_set_feature(qts, cpu_type, "pauth", true);
> +    assert_set_feature(qts, cpu_type, "pauth-impdef", true);
> +    assert_set_feature(qts, cpu_type, "pauth-impdef", false);
> +    assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth",
> +                 "{ 'pauth': false, 'pauth-impdef': true }");
> +}
> +
>  static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
> @@ -462,6 +474,7 @@ static void test_query_cpu_model_expansion(const void *data)
>          assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
>  
>          sve_tests_default(qts, "max");
> +        pauth_tests_default(qts, "max");
>  
>          /* Test that features that depend on KVM generate errors without. */
>          assert_error(qts, "max",
> -- 
> 2.25.1
> 
> 

Thanks,
drew


