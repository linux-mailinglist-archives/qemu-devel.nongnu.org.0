Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C84895DB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:59:47 +0100 (CET)
Received: from localhost ([::1]:33732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rSs-0005n1-6x
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rQ9-0004ek-Qe
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:56:57 -0500
Received: from [2a00:1450:4864:20::429] (port=39479
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rQ8-0000Zv-5f
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:56:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id s1so25664538wra.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QObmCrZ7A9valp4sjBJ98IGI97Q2xNU6waz7OMz6cTM=;
 b=UtJ6fCP55gJRrUjGvYvT0TWre975j88nWybnkpcGaEtt8HcIQ61hs1rLlyJ/g1XOnt
 2KjJP03s2sVIy4Csc54VyEWNM0W2p9aaA+AnydvvfnKGMGpLBGQbCo4twI3BW+0KHfsU
 pwxvmZuUSvnBp+i6XrlNsFeMeS9FIygH6+Yho5R243h6kYTpFyXoK3asmJw9TVSjrOYS
 HXHUu7SfS3leo9vLyhIOvSSnwRgRUT/iaJ7jM6/DAht7fix7zJeAfUGzfjWSbyhY/R6L
 X8ZQxbn3/uaoGyhNBL9i1uA/LLnVXWGMFeUxRkhJN5Tqq1n6GwEH08PYXscpuNM53On6
 KA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QObmCrZ7A9valp4sjBJ98IGI97Q2xNU6waz7OMz6cTM=;
 b=YK5Ci+fW1+tU13mxKbG/sxCoOVlMnuzAsp6bIuogIWjQ3cqJ250MO1OaFsC9yN2/ZD
 4c4sR+b3G9A/hzPOB5s+ceTIDqyN3ioaxIq6e6EfzFeN3f62MNmXPWOuaYHKdRrNp3FS
 CEkzXiV39PdJ70i+8vbXzjIIFFZP5/QJPvAZoBgDrRsSfxfU/tT2s5ooH9IsJbWJDJJg
 Dwk55niO1ACaWpaW32Q03nDecDWQzIGBBf8T5Lv1rAHGK2+yBiyWR/V7w/JjyRtyJpwB
 pGEFpRfAiNImMqHOPZ0jeJNLoK7iFsCUG3K4mClU/JwpLVjUJz08gDABtM0vL9Yu9efV
 bw7Q==
X-Gm-Message-State: AOAM531vA+O5n1P3mf7jXTDt4DjB5aB+stDxdM0iYy6CCICfJgyStg4B
 fy7mirE8svMfXCEvt9OTZms=
X-Google-Smtp-Source: ABdhPJx+DosGHndNkg5Uj58XgSdcRe9TLyZRkOHZ772ATbcJRzAnipRYnQVumqYcSf46T0+0mj0emg==
X-Received: by 2002:adf:d228:: with SMTP id k8mr4788142wrh.462.1641808614785; 
 Mon, 10 Jan 2022 01:56:54 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id 11sm7986600wrz.63.2022.01.10.01.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:56:54 -0800 (PST)
Message-ID: <54a910ca-586d-9bb1-de7d-aa4578b019ae@amsat.org>
Date: Mon, 10 Jan 2022 10:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 27/34] tests/avocado: add :avocado: tags for some tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, crosa@redhat.com,
 Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-28-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105135009.1584676-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 14:50, Alex Bennée wrote:
> This stops a bunch of tests failing because of a lack of
> "./qemu-system-x86-64" in a build directory where you have configured
> only one non-default target. I suspect what we really need is:
> 
>     :avocado: tags=arch:host

This doesn't seem right, these tests are generic...

> to be properly multi-arch safe.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/avocado/empty_cpu_model.py | 3 +++
>  tests/avocado/info_usernet.py    | 3 +++
>  tests/avocado/migration.py       | 1 +
>  tests/avocado/version.py         | 1 +
>  tests/avocado/vnc.py             | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/tests/avocado/empty_cpu_model.py b/tests/avocado/empty_cpu_model.py
> index 22f504418d..ffe27780a3 100644
> --- a/tests/avocado/empty_cpu_model.py
> +++ b/tests/avocado/empty_cpu_model.py
> @@ -11,6 +11,9 @@
>  
>  class EmptyCPUModel(QemuSystemTest):
>      def test(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>          self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
>          self.vm.set_qmp_monitor(enabled=False)
>          self.vm.launch()
> diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
> index dc01f74150..bafbc0e23e 100644
> --- a/tests/avocado/info_usernet.py
> +++ b/tests/avocado/info_usernet.py
> @@ -16,6 +16,9 @@
>  class InfoUsernet(QemuSystemTest):
>  
>      def test_hostfwd(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>          self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
>          self.vm.launch()
>          res = self.vm.command('human-monitor-command',
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 584d6ef53f..4e5516f425 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -22,6 +22,7 @@
>  class Migration(QemuSystemTest):
>      """
>      :avocado: tags=migration
> +    :avocado: tags=arch:x86_64
>      """
>  
>      timeout = 10
> diff --git a/tests/avocado/version.py b/tests/avocado/version.py
> index ded7f039c1..be794b9354 100644
> --- a/tests/avocado/version.py
> +++ b/tests/avocado/version.py
> @@ -15,6 +15,7 @@
>  class Version(QemuSystemTest):
>      """
>      :avocado: tags=quick
> +    :avocado: tags=arch:x86_64
>      """
>      def test_qmp_human_info_version(self):
>          self.vm.add_args('-nodefaults')
> diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
> index 096432988f..1f80647414 100644
> --- a/tests/avocado/vnc.py
> +++ b/tests/avocado/vnc.py
> @@ -14,6 +14,7 @@
>  class Vnc(QemuSystemTest):
>      """
>      :avocado: tags=vnc,quick
> +    :avocado: tags=arch:x86_64
>      """
>      def test_no_vnc(self):
>          self.vm.add_args('-nodefaults', '-S')

