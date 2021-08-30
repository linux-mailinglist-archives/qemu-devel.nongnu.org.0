Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDA3FBA35
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 18:34:49 +0200 (CEST)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKkF8-0003oQ-On
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 12:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKkDr-0002Ro-5s
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKkDo-0003h6-Ju
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 12:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630341199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QzU22T1TNm6Fan0bvsPLAoobHC1WHCIh9PxsKq4/7s=;
 b=eekTXHp1EzD08UmwlV31o+sgkkigc2yUrdCKFyYQH8e9CMU4lA4hIZ3by9PY1qlbbQmv2R
 6e/zC6DqTY6rLzi4yEmFwX3BXsJOTmiw5NgJw5xDUrEEPNwZKUK9B+FdHpyI77QY89hAc7
 PIgZ9/tENhhaaRY3UMTb6F2yWSeb28Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-ZNoSIQl3PhW00LdrPvj08A-1; Mon, 30 Aug 2021 12:33:18 -0400
X-MC-Unique: ZNoSIQl3PhW00LdrPvj08A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so4897360wma.4
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 09:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9QzU22T1TNm6Fan0bvsPLAoobHC1WHCIh9PxsKq4/7s=;
 b=p8ujOXUHHT76ROCHLu2lGXHbG3XUCLwFgm/132ddZSYg0oIPOtxVfQ5qq9eVixpKH1
 1CNyFMUMXFjle/Nlp4VY3FJsl02dnEVzyGMlMouzziInAa4yG/zth8OaO5DHS68o9XxT
 hzK6vJ5mlFu66bQPtMAip3jZcAu9ii4Nz5ddQLu4VV71gGqHrIqLxEpOD6hZkhhD6ERx
 zoIqgS1UwNW6/5TPLMWmdvckMPwcTxU+5OEV98oJ9IM3xaJAAY/EYIkLQXTaWXvj0dXJ
 1qXi2hvLqKCCrFCaAOXkvcFZjdvVv1XzBU+fz5BZPuWrVM/oWQlK9d6TiJhGE9dbtgHl
 b4lA==
X-Gm-Message-State: AOAM530qA2305eqI6ky2aRu48UzSbdsjI7jgOSW4FTtz6aCsM0RV6Y3x
 rriiLhE4q4yLLutCFZwQdkMLp9eh2jBEKNAnBcnoRM3UQ2gbh1OYLQiD+ifvMovR1Nr326UjymQ
 bPFfCbyviSt8uGxc=
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr26319227wrr.21.1630341197346; 
 Mon, 30 Aug 2021 09:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQESpp9VJJxtAmb04vWsSA4AGeaQxo0w57KySGZAIs/hPt/PQmZU/wlj2QbSUvs2pRDeyrOg==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr26319212wrr.21.1630341197119; 
 Mon, 30 Aug 2021 09:33:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9e830c4.dip0.t-ipconnect.de.
 [217.232.48.196])
 by smtp.gmail.com with ESMTPSA id z6sm17349wmp.1.2021.08.30.09.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 09:33:16 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-3-thuth@redhat.com>
 <20210830150625.l76qozj4lzmuqsf7@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] configure: Remove options that can be handled via
 meson_options.txt instead
Message-ID: <b21d6830-e1fe-9722-eebe-515d9e4344fc@redhat.com>
Date: Mon, 30 Aug 2021 18:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210830150625.l76qozj4lzmuqsf7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/08/2021 17.06, Eric Blake wrote:
> On Sun, Aug 29, 2021 at 07:32:09PM +0200, Thomas Huth wrote:
>> These trivial options can now be handled via the new generic code
>> that parses meson_options.txt
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure         | 316 +---------------------------------------------
>>   meson_options.txt |   2 +-
>>   2 files changed, 5 insertions(+), 313 deletions(-)
> 
> Picking on one example...
> 
>>
>> diff --git a/configure b/configure
>> index b3e6d51916..cb125c3f84 100755
>> --- a/configure
>> +++ b/configure
>> @@ -291,34 +291,14 @@ for opt do
>>     esac
>>   done
>>   
>> -brlapi="auto"
> 
>> -  --disable-brlapi) brlapi="disabled"
>> -  ;;
>> -  --enable-brlapi) brlapi="enabled"
>> -  ;;
> 
>> @@ -5213,25 +4920,10 @@ if test "$skip_meson" = no; then
>>           -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
>>           ${staticpic:+-Db_staticpic=$staticpic} \
>>           -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
>> -        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
>> -        -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
>> -        -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
>> -        -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
>> -        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
>> -        -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
>> -        -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
>> -        -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
>> -        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
> 
> Pre-patch, if you used neither --enable-brlapi nor --disable-brlapi,
> we called $meson with -Dbrlapi=auto.
> 
>> +        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug -Dmalloc=$malloc \
>> +        -Ddefault_devices=$default_devices -Dxen=$xen -Dtcg=$tcg -Dsdl=$sdl \
>> +        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
>> +        -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>>           $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
>>           -Dtcg_interpreter=$tcg_interpreter $meson_options \
> 
> Post-patch, if you use an option, $meson_options includes
> -Dbrlapi=disabled or -Dbrlapi=enabled (per patch 1), but if you omit
> an option, now we aren't passing anything.  Does meson treat
> -Dbrlapi=auto and the absence of any mention of brlapi identically?

I can confirm what you've already discovered later in your review already: 
The "auto" setting is used by default in meson_options.txt already.

>> diff --git a/meson_options.txt b/meson_options.txt
>> index a9a9b8f4c6..2c89e79e8b 100644
>> --- a/meson_options.txt
>> +++ b/meson_options.txt
>> @@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
>>          description: 'libusbredir support')
>>   option('virglrenderer', type : 'feature', value : 'auto',
>>          description: 'virgl rendering support')
>> -option('vnc', type : 'feature', value : 'enabled',
>> +option('vnc', type : 'feature', value : 'auto',
>>          description: 'VNC server')
> 
> Why is the default for this option changed?  It looks unrelated to the
> mechanical changes in the rest of the patch, enough so to warrant its
> own patch, or at least special mention in the commit message.

Agreed, I think I'll best split it into a separate patch. For the context: I 
should have changed this already in 3a6a1256d46daa2121 ("configure: Allow 
vnc to get disabled with --without-default-features"), but I was not aware 
of the duplicated values between meson_options.txt and the configure script 
at that point in time yet.

  Thomas


