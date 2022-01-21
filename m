Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5F496249
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:46:48 +0100 (CET)
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAw7j-0005rE-Hb
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAvyv-0006DU-0C; Fri, 21 Jan 2022 10:37:44 -0500
Received: from [2a00:1450:4864:20::331] (port=40891
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAvys-0004wq-UQ; Fri, 21 Jan 2022 10:37:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r132-20020a1c448a000000b0034e043aaac7so5633765wma.5; 
 Fri, 21 Jan 2022 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GH0y9yjQsM53Bi4zXihW05s7N1p7sWLA/x+0NBFZtSE=;
 b=argk56xPY8QdRSoDpyC5T1NM3XyqLd5qilcrhGqW3/y2YcT8gpH6c9oCkO23mA0k0q
 2X/9BEZfnwilBCci2EkzwhKCXpq4coyqXyOyCy8WXrMcenTyZsH0F1HAgH3QBvT34qe6
 hDkqjQo8RlK2xBCRQcHtfjY7TJ7668TSjmweThG6WVpHcUZ5ige4r8dwlpSpBywqT5Ro
 RT0qCjLx2saa+JgStabRIl25qLd+kZ8v+voIcM7LCDkEhAmygQQ1tMK5WX63aBPr4wtI
 a0nHJAZ6dmj85bHDJ2e7Pe26cNRNZPsLchy2xX80XLqyM4ofmxdhTVg2CiEsI8N0LlEh
 Mo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GH0y9yjQsM53Bi4zXihW05s7N1p7sWLA/x+0NBFZtSE=;
 b=aO/oZfeXtUi1UC/4KDz+XJlGAtRQHGNgxJTfKFrSkgczGTIMf+RS1Hz3U8TdQko0hR
 BSUmiflk7b+7YbFrBxoNJJaAIBxGcb3d7YY6uGUekMHyufmpr59mkgJvUP8g//CGFgL9
 yBc0+Jpy+GZ35XPqkFNtjdqrKBuDuHwYimOwWr9AoIZOJB23pd0nvdUqhyAhJi1OiJRD
 v4dSakeizhy/wbtvb6HWtKa18N+0M5Vvdka6Z7Xn6MHoN3L+3sOfMt5lGgGFMf79NA3H
 OcVBGCaeelzo/3gWmyI2vbxvsAPm6UWDujgvFO/ydO7hzxQc90iGVreMTA1nZ9MK9khR
 4lug==
X-Gm-Message-State: AOAM533B2Q02oLq+8dE0pCUUkwgC3N246drr3QI1yaJkB1I8qTA5DgXj
 /E4oEI68yrAxnPNQebqDrGk=
X-Google-Smtp-Source: ABdhPJxB79H/4KACug6jJV05r7/njsjqrI8Diwk8drKEDNtQye1JgR02MSaZFLMbAkIjhiYsK7a1Tw==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr1218676wmb.29.1642779456389;
 Fri, 21 Jan 2022 07:37:36 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o5sm2228634wrc.30.2022.01.21.07.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 07:37:35 -0800 (PST)
Message-ID: <63d2f253-745b-ad0c-b586-519cb8e8fa04@amsat.org>
Date: Fri, 21 Jan 2022 16:37:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 4/8] tests: Refresh lcitool submodule
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-5-f4bug@amsat.org>
 <9d09394f-20b3-eb07-d962-9d723b0d3c3d@redhat.com>
 <YeqdROki4KJkT8RR@redhat.com>
 <CANCZdfoBYJ=G29YmoQ49GF8pVUveVZw6NyDB3KfQFpbyod3+ZQ@mail.gmail.com>
 <YerEhdb5rbSKPoEC@redhat.com>
In-Reply-To: <YerEhdb5rbSKPoEC@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 1/21/22 15:34, Daniel P. Berrangé wrote:
> On Fri, Jan 21, 2022 at 07:30:55AM -0700, Warner Losh wrote:
>> On Fri, Jan 21, 2022 at 4:47 AM Daniel P. Berrangé <berrange@redhat.com>
>> wrote:
>>
>>> On Fri, Jan 21, 2022 at 12:40:48PM +0100, Thomas Huth wrote:
>>>> On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
>>>>> Refresh lcitool submodule and the generated files by running:
>>>>>
>>>>>    $ make lcitool-refresh
>>>>>
>>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>   .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>>>>>   .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>>>>>   tests/docker/dockerfiles/alpine.docker        | 3 ++-
>>>>>   tests/docker/dockerfiles/centos8.docker       | 3 +--
>>>>>   tests/docker/dockerfiles/fedora.docker        | 3 +--
>>>>>   tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>>>>>   tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
>>>>>   tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>>>>>   tests/lcitool/libvirt-ci                      | 2 +-
>>>>>   9 files changed, 10 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars
>>> b/.gitlab-ci.d/cirrus/freebsd-12.vars
>>>>> index 9c52266811f..bdcce578edf 100644
>>>>> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
>>>>> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
>>>>> @@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
>>>>>   NINJA='/usr/local/bin/ninja'
>>>>>   PACKAGING_COMMAND='pkg'
>>>>>   PIP3='/usr/local/bin/pip-3.8'
>>>>> -PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc gettext git
>>> glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs
>>> libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses
>>> nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py38-numpy
>>> py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme py38-virtualenv
>>> py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract
>>> texinfo usbredir virglrenderer vte3 zstd'
>>>>> +PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache
>>> cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils dtc fusefs-libs3
>>> gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt
>>> libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust
>>> lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf
>>> png py38-numpy py38-pillow py38-pip py38-sphinx py38-sphinx_rtd_theme
>>> py38-virtualenv py38-yaml python3 rpm2cpio sdl2 sdl2_image snappy
>>> spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
>>>>
>>>> Aren't the FreeBSD jobs currently failing due to lttng-ust not being
>>>> available anymore? ... I'd somehow expected that this update might fix
>>> this,
>>>> too, but I still see lttng-ust in the list here?
>>>
>>> I had prepped an update to drop it, but @bsdimp indicated that it ought
>>> to be a transient problem so I never applied it, hoping it would fix
>>> itself.
>>>
>>> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/211
>>>
>>> It has been broken for ~2 weeks now though, and lttng-ust is not an
>>> especially critical feature so we should probably just go ahead and
>>> disable it regardless.
>>>
>>
>> I agree. I got some back and forth from the FreeBSD community about whether
>> or not
>> it was coming back. I think we should drop the package until that back and
>> forth results
>> in it being available again.
> 
> The above change to remove lttng-ust is merged in libvirt-ci.git, so
> a sub-module update && make lcitool-refresh in QEMU will pull it in.

Is that an implicit way to ask me to refresh and respin this series
again? I already posted a v5... It looks like a never ending story
with the submodule being updated and reducing patches churn.
I'll post a v6 but if v7 is required I'll ask someone else to keep
refreshing QEMU side.

Thanks.

