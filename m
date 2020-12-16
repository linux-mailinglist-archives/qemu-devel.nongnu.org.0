Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC22DC362
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:48:19 +0100 (CET)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZ2I-0000Kj-60
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:48:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYq2-0004q9-AC
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYpw-00025D-KY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608132931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZNe883mqJGUQzDKqwq12oLwwfYGGmqCnJfRzP/jt1g=;
 b=DKchUctEdapup4+0KE+WXkElmHLeeS8wieLLVy2ElInSstYoxr/eFNNv0KOOQ8hyTTvu+S
 iEkSrJo+bJMVWRhLTxj8nXmcOHZvo9gxrD3Ez5eWHWCGnwaadlmn6DcPxXkxrN+du5tyjv
 gTFB+B/Z5UxCZ84qYmVg7hfdrfKr91Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-wj3z66vxPBWwSEguUmfzKA-1; Wed, 16 Dec 2020 10:35:28 -0500
X-MC-Unique: wj3z66vxPBWwSEguUmfzKA-1
Received: by mail-ed1-f72.google.com with SMTP id g8so11971022edm.7
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+ZNe883mqJGUQzDKqwq12oLwwfYGGmqCnJfRzP/jt1g=;
 b=o42xq8MGCo4HFUPIF+B5cIbnBWuh6nYYveobc8LLbCh17/zfMVJG0BG+3sJVJX9Hn5
 0F8/HcaFOzJ7G+dqxQs20sff3OFO0NBwH6covlsq9SbxKREDYakBC0TFHKmOEHrX8fxn
 d0JcIPMHXcTUWIw0d6v6XZGyI1EQbX9GK1HLBquH4xsNPlsyGnnpQYF7RYwR5EcNxLtr
 z2Ps2jHGyii8EdSlp/7eXKRRJw/Fs/kFDmIJ0PMEZqIQl/vw9cvxmYvFrC0W6FsrIihw
 5784CJ7ggkbBofNKm+QXR54bTDNlAPD7V4kDI1yFVj7UWyN43McZd3Gs6NvUPjyWUj8c
 GMEg==
X-Gm-Message-State: AOAM531U6UjdMi/jIsnadorDO2luNe7Y3KPh4RSbg4bfgyCOvBMxFhSq
 RHS3Te3mDaX7xX04Vlj5TKUjLUe2iqY/JbzDXG3SkuNZjak2VbYJ5omSuQL9eAcoWmuu7BMT6Kd
 RN+FgmIPp/Y1aXE0=
X-Received: by 2002:a50:f604:: with SMTP id c4mr22669892edn.307.1608132927280; 
 Wed, 16 Dec 2020 07:35:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ+3TfaS40ALEtJYhbyBPSXbpl2D5XhXkm9xA+9gc07tGD2ThUF6WvJRsZ4r/mig8DtfvqNQ==
X-Received: by 2002:a50:f604:: with SMTP id c4mr22669865edn.307.1608132927028; 
 Wed, 16 Dec 2020 07:35:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ld2sm1635856ejb.73.2020.12.16.07.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:35:25 -0800 (PST)
Subject: Re: [PATCH v2 3/8] configure: move gettext detection to meson.build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-4-alex.bennee@linaro.org> <873605u92a.fsf@linaro.org>
 <ca2f983f-0b67-37d6-c853-a239105c7e40@redhat.com> <87zh2dsrdr.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <07a88043-b578-98c4-6860-923fedf68db1@redhat.com>
Date: Wed, 16 Dec 2020 16:35:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87zh2dsrdr.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 16:27, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 16/12/20 15:19, Alex Bennée wrote:
>>>
>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>
>>>> This will allow meson to honour -Dauto_features=disabled later.
>>>>
>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> ping Paolo, are you happy with this bit?
>>
>> Yes, I'm so happy with this and the --with-default-features parts that I
>> was going to include it in my next pull request. :)
> 
> I'm putting together an testing one now (as there is a testing update as
> well).

Great, I'll rebase when it hits qemu.git.

Paolo

>>
>> Series
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Paolo
>>
>>>> ---
>>>>    configure         | 19 +++----------------
>>>>    meson_options.txt |  2 +-
>>>>    po/meson.build    |  2 +-
>>>>    3 files changed, 5 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/configure b/configure
>>>> index 8f2095a2db..46fdea88c7 100755
>>>> --- a/configure
>>>> +++ b/configure
>>>> @@ -448,7 +448,7 @@ libdaxctl=""
>>>>    meson=""
>>>>    ninja=""
>>>>    skip_meson=no
>>>> -gettext=""
>>>> +gettext="auto"
>>>>    
>>>>    bogus_os="no"
>>>>    malloc_trim="auto"
>>>> @@ -1014,9 +1014,9 @@ for opt do
>>>>      ;;
>>>>      --enable-vnc) vnc="enabled"
>>>>      ;;
>>>> -  --disable-gettext) gettext="false"
>>>> +  --disable-gettext) gettext="disabled"
>>>>      ;;
>>>> -  --enable-gettext) gettext="true"
>>>> +  --enable-gettext) gettext="enabled"
>>>>      ;;
>>>>      --oss-lib=*) oss_lib="$optarg"
>>>>      ;;
>>>> @@ -2839,19 +2839,6 @@ if test "$xen_pci_passthrough" != "disabled"; then
>>>>      fi
>>>>    fi
>>>>    
>>>> -##########################################
>>>> -# gettext probe
>>>> -if test "$gettext" != "false" ; then
>>>> -  if has xgettext; then
>>>> -    gettext=true
>>>> -  else
>>>> -    if test "$gettext" = "true" ; then
>>>> -      feature_not_found "gettext" "Install xgettext binary"
>>>> -    fi
>>>> -    gettext=false
>>>> -  fi
>>>> -fi
>>>> -
>>>>    ##########################################
>>>>    # X11 probe
>>>>    if $pkg_config --exists "x11"; then
>>>> diff --git a/meson_options.txt b/meson_options.txt
>>>> index f6f64785fe..191e848600 100644
>>>> --- a/meson_options.txt
>>>> +++ b/meson_options.txt
>>>> @@ -9,7 +9,7 @@ option('sphinx_build', type : 'string', value : '',
>>>>    
>>>>    option('docs', type : 'feature', value : 'auto',
>>>>           description: 'Documentations build support')
>>>> -option('gettext', type : 'boolean', value : true,
>>>> +option('gettext', type : 'feature', value : 'auto',
>>>>           description: 'Localization of the GTK+ user interface')
>>>>    option('install_blobs', type : 'boolean', value : true,
>>>>           description: 'install provided firmware blobs')
>>>> diff --git a/po/meson.build b/po/meson.build
>>>> index 1387fd979a..a863f0575f 100644
>>>> --- a/po/meson.build
>>>> +++ b/po/meson.build
>>>> @@ -1,6 +1,6 @@
>>>>    i18n = import('i18n')
>>>>    
>>>> -if get_option('gettext')
>>>> +if find_program('xgettext', required: get_option('gettext')).found()
>>>>      i18n.gettext(meson.project_name(),
>>>>                   args: '--msgid-bugs-address=qemu-devel@nongnu.org',
>>>>                   preset: 'glib')
>>>
>>>
> 
> 


