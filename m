Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924403404BE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:37:57 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqyS-0006Lu-M6
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqxX-0005nM-JF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:36:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqxT-0005vE-TA
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616067415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yZBRRu1U4wbTvUWz5YMkqjxN+VfYivsZOKV+3KoFEU=;
 b=UR46L/5cWW47bsSBaMU7VSFNPpPh3CtZ/jZo5c65ueUcmO+VN8Nr8nR8hYfn/X9Ao+X0Mf
 2CjIS0Bn6xEb2iJmT0ghAYGlnlCoNpfYwc0NeHxNTdNyEccIKivR1tt23pN7tFABr7fjbG
 WIu9KHN3rsK2SN3uF1We2IXIB6pqxhw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-T3-yfeB2MyaI2FQCaWNtng-1; Thu, 18 Mar 2021 07:36:52 -0400
X-MC-Unique: T3-yfeB2MyaI2FQCaWNtng-1
Received: by mail-wm1-f71.google.com with SMTP id c7so11687890wml.8
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2yZBRRu1U4wbTvUWz5YMkqjxN+VfYivsZOKV+3KoFEU=;
 b=JHJFtRMy/szbfEKbhsHlJJXjcnPDgrLxb2UyCAGjM3UXDFdG5ZbOgJFhVrQODooHI2
 FzmbJDpbSUfuXL80TjHGhYp29GXhxQi5o9u2dMpWqKAPlEY8ID0UNroGv7y6/17BjGMg
 CXtSeP3Yqx7xQLdI8zThpVH29swyfDCMEE/61yOb3SP8SypUqNDhOH0fNUBlylNJJS5W
 Oec+UCzT58VbxCAifX6QHFIFHo2GfcDNR0E0dVJ/8+cxtZtnh79Z10J4OG1L0EWqAsEg
 6tSKoNJUkEg1QagODXeRdLWgKY4qS+tG6BJ1+NlCDe9gLgAYzm3H56TwxJ6r5bkcWBXw
 K3gw==
X-Gm-Message-State: AOAM530edU7Smg7OAOEvU8myJKgqMHzDB3kRMzHUUVwU93+NffYyIOqZ
 9lOxHgryPe55J01F6MJprRl9+oZm4x7zE1RgTFS3nOUSsbcyqd2tGjdfBnyfCHT83UcCd9L+mS/
 eZ+tmOSHPnunq4Us=
X-Received: by 2002:adf:fe48:: with SMTP id m8mr9096782wrs.135.1616067410655; 
 Thu, 18 Mar 2021 04:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2FfjCt7svOCL7keCeYNdfF736M61wJsI8uy/UlOouTMCyJGlYQoGEdRPY693AGdarFuKIbA==
X-Received: by 2002:adf:fe48:: with SMTP id m8mr9096739wrs.135.1616067410416; 
 Thu, 18 Mar 2021 04:36:50 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a6sm2373124wmm.0.2021.03.18.04.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 04:36:50 -0700 (PDT)
Subject: Re: [RFC PATCH 1/2] modules: introduce target specific modules
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, Anup Patel <anup@brainfault.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20210316122648.3372459-1-pasic@linux.ibm.com>
 <20210316122648.3372459-2-pasic@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9b103263-c3fa-79b9-5ff7-349bfbf60d78@redhat.com>
Date: Thu, 18 Mar 2021 12:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316122648.3372459-2-pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Boris Fiuczynski <fiuczy@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Halil,

On 3/16/21 1:26 PM, Halil Pasic wrote:
> After some back-and-forth in [1] Daniel suggested that
> we could/should make qemu modules per-target by introducing a
> dedicated modules directory for each target, which can symlink the
> modules that do work with and do make sense for the given target.
> 
> That way we can avoid trying to load modules we know won't work and
> coming up with convoluted ways for making subsequent failures graceful.
> The topic of per-target modules was discussed before [1] but, the
> idea with the symlinks originates from [1].
> 
> This patch introduces  this new scheme of loading modules without
> actually introducing any changes to what modules are available to what
> targets. For the exploitation have look at 'hw/s390x: modularize
> virtio-gpu-ccw'.
> 
> [1] https://mail.gnu.org/archive/html/qemu-s390x/2021-03/msg00206.html
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Suggested-by: "Daniel P. Berrangé" <berrange@redhat.com>
> ---
>  hw/s390x/meson.build               |  1 -
>  include/qemu/module.h              |  2 ++
>  meson.build                        | 43 +++++++++++++++++++++++++++++-
>  roms/SLOF                          |  2 +-
>  roms/opensbi                       |  2 +-
>  scripts/call_generated_script.sh   |  6 +++++
>  scripts/modules/target-symlinks.sh | 31 +++++++++++++++++++++
>  softmmu/runstate.c                 |  1 +
>  util/module.c                      | 13 +++++++--
>  9 files changed, 95 insertions(+), 6 deletions(-)
>  create mode 100755 scripts/call_generated_script.sh
>  create mode 100755 scripts/modules/target-symlinks.sh

> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 944d403cbd..85a59fde81 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -73,4 +73,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
>  void module_load_qom_one(const char *type);
>  void module_load_qom_all(void);
>  
> +void set_emulator_modules_dir(char const *dir_name);
> +
>  #endif
> diff --git a/meson.build b/meson.build
> index a7d2dd429d..8926968182 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1749,6 +1749,7 @@ user_ss = ss.source_set()
>  util_ss = ss.source_set()
>  
>  modules = {}
> +modules_restricted = {}
>  hw_arch = {}
>  target_arch = {}
>  target_softmmu_arch = {}
> @@ -2092,14 +2093,54 @@ common_ss.add(hwcore)
>  # Targets #
>  ###########
>  
> +module_targets = []
>  foreach m : block_mods + softmmu_mods
> -  shared_module(m.name(),
> +   module_targets += shared_module(m.name(),
>                  name_prefix: '',
>                  link_whole: m,
>                  install: true,
>                  install_dir: qemu_moddir)
>  endforeach
>  
> +foreach target : target_dirs
> +  if not target.endswith('-softmmu')
> +    continue
> +  endif
> +  filtered_module_targets = []
> +  foreach m : module_targets
> +    restricted_to = modules_restricted.get(m.name(), [])
> +    if restricted_to.length() == 0 or restricted_to.contains(target)
> +      filtered_module_targets += m
> +    endif
> +  endforeach
> +  s = custom_target('Make symbolic links script for ' + target + ' modules' ,
> +		   input: filtered_module_targets,
> +		   output: 'make_mod_symlinks_'+target+'.sh',
> +		   install: false,
> +		   depends: filtered_module_targets,
> +		   build_by_default: true,
> +		   build_always_stale: true,
> +		   command: [
> +                     meson.current_source_dir() / 'scripts/modules/target-symlinks.sh',
> +		     '@OUTPUT@',
> +		     target,
> +		     '@INPUT@'
> +		   ])
> +
> +  # We run the script as a part of the build so things keep working form the
> +  # build tree (without requiring an instalation). I couldn't find a nicer way.
> +  custom_target('Run symbolic links script for ' + target + ' modules' ,
> +		   depends: s,
> +		   output: 'make_mod_symlinks_'+target+'.sh.dummy',
> +		   install: false,
> +		   build_by_default: true,
> +		   build_always_stale: true,
> +		   command: [
> +		     s.full_path(),
> +                     meson.current_build_dir()
> +		   ])
> +  meson.add_install_script(meson.current_source_dir() / 'scripts/call_generated_script.sh', s.full_path(), qemu_moddir)
> +endforeach
>  softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
>  common_ss.add(qom, qemuutil)
>  
> diff --git a/roms/SLOF b/roms/SLOF
> index 33a7322de1..e18ddad851 160000
> --- a/roms/SLOF
> +++ b/roms/SLOF
> @@ -1 +1 @@
> -Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
> +Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
> diff --git a/roms/opensbi b/roms/opensbi
> index 234ed8e427..a98258d0b5 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
> +Subproject commit a98258d0b537a295f517bbc8d813007336731fa9

While your patch deals with "target modules", the 2 submodule
changes are unrelated, right?


