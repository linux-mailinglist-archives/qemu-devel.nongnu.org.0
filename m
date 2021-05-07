Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0D376314
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 11:48:12 +0200 (CEST)
Received: from localhost ([::1]:54316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lex5f-0007DT-2I
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 05:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lex3P-0006PY-O3
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lex3L-0007ia-TM
 for qemu-devel@nongnu.org; Fri, 07 May 2021 05:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620380745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFlvZFo2V4HkIO+qESDxS3FtN6mWkKVB0IZzv63kJQU=;
 b=BnQ0FQaQYortcU7//J6ZLw4iaxRdki/mbytYTLCmNA/IfoSC++bJhlN73K40xYqqP56oa7
 WCXcpcuvN4naZE+cEaLTMUihtDlftkVxCtheuSkKbkisMo3pKIR3QWWZhW0ffdQxK+Bm1k
 EESe1dOshpF0Pp7OX/IcQuh+YkpHHQc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-2JrZMbq8PGGNaoVbavkGgA-1; Fri, 07 May 2021 05:45:43 -0400
X-MC-Unique: 2JrZMbq8PGGNaoVbavkGgA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so3346687wre.18
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 02:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NFlvZFo2V4HkIO+qESDxS3FtN6mWkKVB0IZzv63kJQU=;
 b=az88ZielyeYTT+Lc78CdGklxr9BnGXQ4zyADaJXueurwos7OCDgugu8pHutI2LLD1v
 HrsQLRZAypUv6FfmR/COO0jFTBFN9DKSZ3ZL77MTggHBGXx2v+tNQXYAFUAywdhcn+ay
 PwH4zZbtsTp0LIcfWT5oUdX37sXVDsD5yIGxA8cmrxh7OuM377m/Tt9LvpgwW6JJyNPN
 clUi+DDZUAggSBD6X+tKUFWXaMsaF+rBMue3FlEOUCCpsGR5OsA4RmZT42II8KiGm88d
 UaTgN6oXOEQ5y6JSkmtSBnfrgFGI11fV5Tg1Fkh6fZZwwiVsi834Bk8CzHL6v6XgtJXT
 JpGQ==
X-Gm-Message-State: AOAM531lCca7YlVKQclZRAQa04+G6q0F7LVvnxMOEBc93QEBZsT3GWKV
 OXg+7qFXSiR0gH21mVyKwIrjy2aWYGszgGPgJwj99ALgfqyW+DQylbJg0CAzVrmZwgAzhkHVsie
 l3JMotaNpeihSzYQozy0etho+uUz+zYBnS9tTaXx8QNjYMj85IiMYnAnnc6/f1O8=
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr11041151wri.74.1620380742349; 
 Fri, 07 May 2021 02:45:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv5YluJZk9e01sQ9dVp37CNh7KFuFpvRVPE6UsIH+3VhjwHvXHOY+fWw4WG6w0ToH5dXyzzQ==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr11041117wri.74.1620380742021; 
 Fri, 07 May 2021 02:45:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9575b79.dip0.t-ipconnect.de.
 [217.87.91.121])
 by smtp.gmail.com with ESMTPSA id g11sm8276003wri.59.2021.05.07.02.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 02:45:41 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
Date: Fri, 7 May 2021 11:45:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/2021 09.38, Peter Maydell wrote:
> On Thu, 6 May 2021 at 08:01, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 05/05/2021 20.06, Peter Maydell wrote:
>>> On Mon, 3 May 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>>    Hi Peter,
>>>>
>>>> the following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf:
>>>>
>>>>     Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' into staging (2021-05-02 12:02:46 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03
>>>>
>>>> for you to fetch changes up to 8f582fa290e5d5d0a00db23eaf1ab1bb3d3ae68d:
>>>>
>>>>     util/compatfd.c: Replaced a malloc call with g_malloc. (2021-05-03 11:40:40 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> * Removal of the deprecated moxie target
>>>> * Replace some YAML anchors by "extends" in the Gitlab-CI
>>>> * Some small improvements for using the qtests
>>>> * Some other small misc patches
>>>
>>> This fails to build as an incremental (not from-clean) build:
>> [...]
>>> ../../meson.build:1291:2: ERROR: Failed to load
>>> /home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak: [Errno 2]
>>> No such file or directory:
>>> '/home/ubuntu/qemu/default-configs/targets/moxie-softmmu.mak'
>>
>> D'oh! I think I can work-around the problem with a patch like
>> this on top:
>>
>> diff a/configure b/configure
>> --- a/configure
>> +++ b/configure
>> @@ -1686,6 +1686,11 @@ fi
>>
>>    for config in $mak_wilds; do
>>        target="$(basename "$config" .mak)"
>> +    if [ "$target" = "moxie-softmmu" ]; then
>> +        # This is a work-around to make incremental builds pass after
>> +        # moxie-softmmu has been removed. It can be removed later.
>> +        continue
>> +    fi
>>        if echo "$target_list_exclude" | grep -vq "$target"; then
>>            default_target_list="${default_target_list} $target"
>>        fi
>> diff a/default-configs/targets/moxie-softmmu.mak b/default-configs/targets/moxie-softmmu.mak
>> new file mode 100644
>> index 0000000000..23fd596b66
>> --- /dev/null
>> +++ b/default-configs/targets/moxie-softmmu.mak
>> @@ -0,0 +1,2 @@
>> +# This is just a dummy file to avoid that incremental builds are failing.
>> +# It can be removed as soon as all builders have been updated.
>>
>> Does that look acceptable? If yes, I'll respin my PR with that
>> squashed into the moxie patch.
> 
> Ugly, but I guess so. It would be nice to fix the underlying cause, though:
> meson/ninja should just DTRT if we remove a target. We have a couple
> of other target removals coming through as well...

Ok, after having another close look, I think the main problem here is that
"configure" does not get re-run, and thus a wrong set of TARGET_DIRS get
supplied to meson. I think this should fix it:

diff --git a/Makefile b/Makefile
index bcbbec71a1..3088502329 100644
--- a/Makefile
+++ b/Makefile
@@ -85,7 +85,8 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
  endif
  
  # 1. ensure config-host.mak is up-to-date
-config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
+config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION \
+                $(SRC_PATH)/default-configs/targets
         @echo config-host.mak is out-of-date, running configure
         @if test -f meson-private/coredata.dat; then \
           ./config.status --skip-meson; \

I.e. re-run configure if somethings in default-configs/targets changed.
Does that look sane?

  Thomas


