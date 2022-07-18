Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED6577D5A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:19:25 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDLyO-00010t-CY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLwl-000817-Kv
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDLwi-00062u-Cg
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658132259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGs+HOtr8h/+b+0cEm+odV65VmWjPV8J+ziFWkCuL1Q=;
 b=dtpZLcYQDHvZgCBY4Y2aZCLXDj5zol0QUfxGN0AEpx5V9KTywhhDoYfA5kUmwyHWiSkKgc
 f4YT/EzpWICKmqRn8KPECeCer7PNUkS3ODWLS382eKC0RNMWPFK9xfUAhUWXm5A2c/WJbj
 laoYTaLREXTtBMLqmYONvv+r6jM3fPg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-5u5X3vTQM8yeImnj9owWkw-1; Mon, 18 Jul 2022 04:17:38 -0400
X-MC-Unique: 5u5X3vTQM8yeImnj9owWkw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003a315c2c1c0so2925448wmb.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 01:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGs+HOtr8h/+b+0cEm+odV65VmWjPV8J+ziFWkCuL1Q=;
 b=Uokik7agQ5ibwxVT5+Lgwvfn51NS5pNNCx9TtMPxTU9hEzqCTWgBF91QWe9YSXyJ64
 i/DgJYyczVZU0p/xTTJ25S7bF2nvC+PDUZt9h81n5mJ24JOMUKpkfz3fuk6Ks876VXbb
 gIOaU6NvYHSzpCHriWmRITD2f94yBRM0D6ZAmnoGkWfK/onCSPjc+wJ89AxY4Oppt5PW
 gssMtL4dSQAh2xhaV9C063TPD1zs2NyTrvATEpE7YBDhNoefF3e+jgzThEf2ZkfcQVAo
 03Xi9XBOjLMqY+JyfZT7UshZgL6T/A5J7yjYoFrib87K6mn8adV9z/4tR77MqxoVG0zR
 a9xw==
X-Gm-Message-State: AJIora/GYVTKPT89hBra4ipadkMeK5fMYDkoDf1bEt7qc4fDw/9vbAg+
 qFB3MyG38SaE6Jk1G2dBRc7nBwaMB8JSnLCf6Beb9Ap6Ux3rfVRhf9RuAh5NvbcE8EIsRHQr4Sk
 jMo8lewY1/ps7+Xc=
X-Received: by 2002:a05:6000:15ca:b0:21d:a72d:beb8 with SMTP id
 y10-20020a05600015ca00b0021da72dbeb8mr21696745wry.624.1658132257082; 
 Mon, 18 Jul 2022 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1FQcMurFQGo/CcrD/PJaMjPer/RU5Jjtpd1X+gbLqt91rWyiadHXUygRqSGNJV9srB5Nxug==
X-Received: by 2002:a05:6000:15ca:b0:21d:a72d:beb8 with SMTP id
 y10-20020a05600015ca00b0021da72dbeb8mr21696719wry.624.1658132256729; 
 Mon, 18 Jul 2022 01:17:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b003a30fbde91dsm9740398wms.20.2022.07.18.01.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 01:17:36 -0700 (PDT)
Message-ID: <07a62298-89e9-2d11-3d3b-441c4b7a96bc@redhat.com>
Date: Mon, 18 Jul 2022 10:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/12] Improve reliability of VM tests
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 08/07/2022 17.34, John Snow wrote:
> Note: patches 10-12 are included for testing simplicity, they shouldn't
> be merged. They will be included in a forthcoming block PR.
> 
> V4:
> 
> - Addressed concern by Marc-Andre in patch 01.
> - Squashed Ubuntu patches (rth)
> 
> This patch series attempts to improve the reliability of several of the
> VM test targets. In particular, both CentOS 8 tests are non-functional
> because CentOS 8 was EOL at the beginning of this calendar year, with
> repositories and mirrors going offline.
> 
> I also remove the ubuntu.i386 test because we no longer support Ubuntu
> 18.04 nor do we have explicit need of an i386 build test.
> 
> After this series, I am able to successfully run every VM target on an
> x86_64 host, except:
> 
> - ubuntu.aarch64: Hangs often during testing, see below.
> - centos.aarch64: Hangs often during testing, see below.
> - haiku.x86_64: Build failures not addressed by this series, see
>    https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg02103.html
> 
> The unit tests that I see fail most often under aarch64 are:
> 
> - virtio-net-failover: Seems to like to hang on openbsd
> - migration-test: Tends to hang under aarch64 tcg
> 
> Future work (next version? next series?);
> 
> - Try to get centos.aarch64 working reliably under TCG
> - Upgrade ubuntu.aarch64 to 20.04 after fixing centos.aarch64
> - Fix the Haiku build test, if possible.
> - Ensure I can reliably run and pass "make vm-build-all".
>    (Remove VMs from this recipe if necessary.)

Not sure whether it's related to your patches, but when testing these I just 
got an error while running 'vm-build-openbsd' :

     VM-BUILD openbsd
fatal: not a valid object name:
failed to archive qemu
Failed to prepare guest environment
Traceback (most recent call last):
   File "/home/thuth/devel/qemu/tests/vm/basevm.py", line 641, in main
     vm.add_source_dir(args.build_qemu)
   File "/home/thuth/devel/qemu/tests/vm/basevm.py", line 277, in add_source_dir
     stdout=self._stdout, stderr=self._stderr)
   File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
     raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['./scripts/archive-source.sh', 
'/home/thuth/tmp/qemu-build/vm-test-rm_z92hq.tmp/data-44e42.tar']' returned 
non-zero exit status 1.

The error did not occur again when running the command again, though.

  Thomas


