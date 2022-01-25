Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D239F49B264
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:55:08 +0100 (CET)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJTf-0001tO-Fq
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:55:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJNR-0004js-LL; Tue, 25 Jan 2022 05:48:41 -0500
Received: from [2a00:1450:4864:20::32f] (port=52048
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJN3-0000cZ-4c; Tue, 25 Jan 2022 05:48:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c2so25017710wml.1;
 Tue, 25 Jan 2022 02:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUi7NhKHb6ZwwVDoJwOMPEtqd8GWR/Fm60RHvrn/m94=;
 b=EWfidj9fa19RmfVEgaFvJOZMp3ZVSX6eu4i2tQXEWBeJ2yf+9qw1+a/yFGOkJAfGPE
 BEKJFE/hHLPibBfQxnh3xBl0sJpt+lUryQ7Te1kJQPOdy/YmostQOI3ZLd1RU0iPY+gk
 HEYHPZ8p3qHg/iAERL5WOvpYdarjkeKHlk1sCr8xky2X/5+Vp4eYdVjsLunofepAPn1+
 08C9cDIYcFhV1VyZ1JPPo4R8GjlfDy6JPGG+UGgpQKYpuNpNvTu96gPi87ONr3kKYiq8
 JDC2BQarIM8g/+E81rSLqfLPQW2UbKtrXw4JSeIWdt9m5byU21PBaDzM5/lzUsavCSN1
 NgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUi7NhKHb6ZwwVDoJwOMPEtqd8GWR/Fm60RHvrn/m94=;
 b=bIKM7tocRf0nwagR1OzMvaaTE1wC+gUryvxZDXEVSR+1ldh0osj6OXzFDHm4LLUsC1
 cQi0X4RB734HnC5pmhJ08EA9D2FZeyfEfNipcFe92zmAs33ifsIrV5OEmP7NWie1w62j
 w4efpB8vTj0/SV6fCr8of06JpdK5Vj7F1xWVcYE+PdytuKna99hst31/wDqh0uR7/7o6
 r4+Kza4g4gezEKHttBZthOHHhmPkeYlI2qfexm8v7bTmyV/5xZQ1U6yNRAu+noKaDr+K
 1fNMB1Ps750JI+7N1qDaCXHR++qnwRff52iYHPwuONanPPNalUKLkZw+uWRaHDvJ0FLX
 ykIw==
X-Gm-Message-State: AOAM532on/tuLL82rxuYDzmU1G4G25Xvf7OCYgouttgGiCsjsjVdPtxB
 3ACvqxoEa2TYWG+UZFX0aOg=
X-Google-Smtp-Source: ABdhPJyjouyeNRyty9fLyHhyzABeX2br64vl4QnGedWm8112ugFLjvJI9F9DSzzJY3nYYNLGrnh6Ew==
X-Received: by 2002:a05:600c:2906:: with SMTP id
 i6mr2384941wmd.14.1643107694645; 
 Tue, 25 Jan 2022 02:48:14 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o14sm5668392wry.104.2022.01.25.02.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:48:14 -0800 (PST)
Message-ID: <637210a2-cd00-211f-7835-13915e984472@amsat.org>
Date: Tue, 25 Jan 2022 11:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 09/22] tests/lcitool: Refresh submodule and remove
 libxml2
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Warner Losh <imp@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-10-alex.bennee@linaro.org>
 <bc4a5a11-ad31-0e63-072e-39b49628c77d@redhat.com>
In-Reply-To: <bc4a5a11-ad31-0e63-072e-39b49628c77d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 1/25/22 11:23, Thomas Huth wrote:
> On 24/01/2022 21.15, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The previous commit removed all uses of libxml2.
>>
>> Refresh lcitool submodule, update qemu.yml and refresh the generated
>> files by running:
>>
>>    $ make lcitool-refresh
>>
>> Note: This refreshment also removes libudev dependency on Fedora
>> and CentOS due to libvirt-ci commit 18bfaee ("mappings: Improve
>> mapping for libudev"), since "The udev project has been absorbed
>> by the systemd project", and lttng-ust on FreeBSD runners due to
>> libvirt-ci commit 6dd9b6f ("guests: drop lttng-ust from FreeBSD
>> platform").
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20220121154134.315047-6-f4bug@amsat.org>
>> ---
>>   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>>   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>>   .gitlab-ci.d/cirrus/macos-11.vars             | 2 +-
>>   tests/docker/dockerfiles/alpine.docker        | 4 ++--
>>   tests/docker/dockerfiles/centos8.docker       | 4 +---
>>   tests/docker/dockerfiles/fedora.docker        | 4 +---
>>   tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>>   tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>>   tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>>   tests/lcitool/libvirt-ci                      | 2 +-
>>   tests/lcitool/projects/qemu.yml               | 1 -
>>   11 files changed, 11 insertions(+), 19 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars
>> b/.gitlab-ci.d/cirrus/freebsd-12.vars
>> index 9c52266811..07f313aa3a 100644
>> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
>> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
>> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>>   NINJA='/usr/local/bin/ninja'
>>   PACKAGING_COMMAND='pkg'
>>   PIP3='/usr/local/bin/pip-3.8'
>> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext
>> git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt
>> libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm
>> lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5
>> pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx
>> py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2
>> sdl2_image snappy spice-protocol tesseract texinfo usbredir
>> virglrenderer vte3 zstd'
>> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc
>> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi
>> libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm
>> lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman
>> pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx
>> py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2
>> sdl2_image snappy spice-protocol tesseract texinfo usbredir
>> virglrenderer vte3 zstd'
>>   PYPI_PKGS=''
>>   PYTHON='/usr/local/bin/python3'
>> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars
>> b/.gitlab-ci.d/cirrus/freebsd-13.vars
>> index 7b44dba324..8a648dda1e 100644
>> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
>> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
>> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>>   NINJA='/usr/local/bin/ninja'
>>   PACKAGING_COMMAND='pkg'
>>   PIP3='/usr/local/bin/pip-3.8'
>> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext
>> git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt
>> libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm
>> lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5
>> pixman pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx
>> py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2
>> sdl2_image snappy spice-protocol tesseract texinfo usbredir
>> virglrenderer vte3 zstd'
>> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc
>> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 libepoxy libffi
>> libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 llvm
>> lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman
>> pkgconf png py38-numpy py38-pillow py38-pip py38-sphinx
>> py38-sphinx_rtd_theme py38-virtualenv py38-yaml python3 rpm2cpio sdl2
>> sdl2_image snappy spice-protocol tesseract texinfo usbredir
>> virglrenderer vte3 zstd'
> 
> Seems like this now also added fusefs-libs3 on FreeBSD which causes the
> build to break:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/2012083924#L3454
> 
> Any ideas how to best fix this?

Candidate patch:
https://lore.kernel.org/qemu-devel/20220124220357.74017-1-f4bug@amsat.org/

