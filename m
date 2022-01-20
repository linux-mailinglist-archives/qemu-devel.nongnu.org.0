Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933A495028
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:32:16 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYU2-0008Ui-Lp
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVSi-0006Wp-So; Thu, 20 Jan 2022 06:18:41 -0500
Received: from [2a00:1450:4864:20::330] (port=44718
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVSh-0004JR-6u; Thu, 20 Jan 2022 06:18:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so12858923wms.3; 
 Thu, 20 Jan 2022 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FlWraR9JdPhicG9uCUvZR0EkpgcWVnHTLFaqJglOCWo=;
 b=FIIs1h5AlFU9Xj9dVz1uQZh4924CjUBWKCfEe4WaIH/8sd9wJGoZ0GvQX/wZEBJeCJ
 PD0u+PgvDZZpgrvu/8Oxjk1350YBgs09X9pADXPWBr7V1Cq5SNrJnDs5TmL15jD1ddks
 hiIE1P7x2zFdwxK1EeTW4WO3TJHGsQqXi4uYCYmyYa0Ln6iLF7Bit/aaoaXEm9YV9mh8
 Ju5DMpdqZuf3J5qKuLyuHaAIIC4L7r6HALbpLsup3ldfPXn3MlIPMSh/g3AN1AZdhVRX
 V81O75QLk8lNb88/J7XR7ZmDFtXOo9SG4hH7t0Vx8DLwoY7Y7gSwZmDDmuNiW4GrVcPc
 9wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FlWraR9JdPhicG9uCUvZR0EkpgcWVnHTLFaqJglOCWo=;
 b=qmD44wrFKNMIaJwYlZyEh3QH2XEkk35aOQQzEPsZV61/d7egXQEeHTmYsO6xR6A4jQ
 o2e+IBTaldCGpwQC/Atlwm9khOdlY5Rog3SaCjWQX3dhI1vPZkUMfStFSW5YjhaZ6vFw
 dudBzeXM0HUL/jEMkMYjvklJkZXuyWY1b6d4ZlXxY/XY8jxNoCoCgXSaMWOmx90UDDHu
 XcBH9Bts+auDKPhc0IaOwR7DB8I5x7HCX7LzqQuHxt6cXi738ou/5Xbiz0bpFzk0nLjh
 na3RUVIHPI51SEzYDwFOwF6bWuGjPM1StI+Yna7Gn2JNNIkFqjR4aefFLKkXoLMZSLgE
 1KzQ==
X-Gm-Message-State: AOAM532i+BVhJ/dePin3tAM0aWn4VAg0iBj+GJlt4ZLCUkFrSL4ZPfGF
 rPk74I7zEFsIMr6kFZxHsic=
X-Google-Smtp-Source: ABdhPJyG/Ga5yS+6fWWJA/8Teg3mkQfVnbWdA7FjCKW6Z9GrCogC3R9A2DOwP43wegWw1iTnCu352A==
X-Received: by 2002:a05:6000:180c:: with SMTP id
 m12mr11179080wrh.581.1642677516168; 
 Thu, 20 Jan 2022 03:18:36 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o33sm14829927wms.3.2022.01.20.03.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 03:18:35 -0800 (PST)
Message-ID: <c38f570a-3fde-e5ae-a427-895e9841b52b@amsat.org>
Date: Thu, 20 Jan 2022 12:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 5/6] tests/lcitool: Remove libxml2
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Ed Maste <emaste@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-6-f4bug@amsat.org> <YelELTScffI7Ln7R@redhat.com>
In-Reply-To: <YelELTScffI7Ln7R@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/20/22 12:14, Daniel P. Berrangé wrote:
> On Thu, Jan 20, 2022 at 12:05:44PM +0100, Philippe Mathieu-Daudé wrote:
>> The previous commit removed all uses of libxml2.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/docker/dockerfiles/alpine.docker        | 1 -
>>  tests/docker/dockerfiles/centos8.docker       | 1 -
>>  tests/docker/dockerfiles/fedora.docker        | 1 -
>>  tests/docker/dockerfiles/opensuse-leap.docker | 1 -
>>  tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
>>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
>>  tests/lcitool/projects/qemu.yml               | 1 -
>>  7 files changed, 7 deletions(-)
> 
> Did you change these dockerfiles manually ?

No.

> There is an 'make lcitool-refresh' target that does it automatically,
> and this should have refreshed the Cirrus CI config files too which
> are missed here.

Odd:

$ make lcitool-refresh
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
tests/fp/berkeley-softfloat-3 dtc capstone slirp
Generate tests/docker/dockerfiles/centos8.docker
Generate tests/docker/dockerfiles/fedora.docker
Generate tests/docker/dockerfiles/ubuntu1804.docker
Generate tests/docker/dockerfiles/ubuntu2004.docker
Generate tests/docker/dockerfiles/opensuse-leap.docker
Generate tests/docker/dockerfiles/alpine.docker
Generate .gitlab-ci.d/cirrus/freebsd-12.vars
Generate .gitlab-ci.d/cirrus/freebsd-13.vars
Generate .gitlab-ci.d/cirrus/macos-11.vars

OK, this fixed it:

-- >8 --
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223d..25301f2ef0b 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -62,7 +62,7 @@ def generate_dockerfile(host, target, cross=None,
trailer=None):

 def generate_cirrus(target, trailer=None):
    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = [lcitool_path, "variables", target, "qemu"]
+   cmd = lcitool_cmd + ["variables", target, "qemu"]
    generate(filename, cmd, trailer)

---

