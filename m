Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF8512234
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 21:11:33 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njn4U-0001Pe-5U
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 15:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njn2d-0000WJ-8k
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 15:09:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njn2b-0008PK-BV
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 15:09:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so949758pjh.4
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 12:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=m3Ft1fI/SodauhsKRpy+8inSoHxN8mV2TTDEBc+doh8=;
 b=poIkWx8hUpnA7awqLp67m0EmZeCIHKDef+4O794q8Tw7oURBbnXDahpQTlyC+24sff
 RCI9cXqLBuFprW4sYoHQOmQfTOHHmhTqX39hoOnc5tdjdBo4l3iH8W49F9VflKmQiTKq
 WI8NbDB2OEi/tk7wpSpltceIn2Jb103IvdWdzxqVCDQDBcdA0Mau3ILTA0a6zqbrG3hT
 igts2H0udPZpwpSiyMfpQuqCLCSa2AurZRFfQEVdIgMeoCNeMvZSUgyrPN09lSrOFXjv
 A52ArKKNNQj9LGikX5Z3Th1fjAAsscF36Jt8QIQFt76Typll47F760YuBtLstk3j+Ntz
 b0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m3Ft1fI/SodauhsKRpy+8inSoHxN8mV2TTDEBc+doh8=;
 b=L5axNsVcTeKbahkKnFjLUlQ/DUGVUByfbDkt/a/PTiWxXcLwjkTL5LA1RhoNPC9458
 7DILcipijDEL6xRB3DjFzJ1dnYZ/cRJFXfiArSdD7ywHGyfGNWoZ8r/6eLeBHFF82Pp8
 IKD3X3s+jCNlgATTi0CPdmerX6MDhHMBUeJGKjMtzGzoTcepKFBNq1OUVRvVhTrzfrWE
 ZZC6YLmNDcESGKXTUgc2WyeVHz9mCGCHgvKfNX0fvUFQEQ2Wj7I3W5hQx035QaqBeseC
 d+A1F/d9xhvyPVstUChe/7GvyrmroWZ0nsIQaKpxd5KIZPyUqe2Sy0lrmu5NbrxnJ0iw
 ZWag==
X-Gm-Message-State: AOAM533yyj0GOWuMy+jIYWqsmCHEppZ+tW1DppS8u8VCOMh/VVhGMzgw
 RzxiehfAzvN5NTL/Sq9ki/zzIw==
X-Google-Smtp-Source: ABdhPJwD08O6eg4f/kKDesQNUjlxh9BYZimMimvlv3eEYtDr6p9jcgFhudxl3B8N162MMcnX8plVcw==
X-Received: by 2002:a17:902:854c:b0:158:35ce:9739 with SMTP id
 d12-20020a170902854c00b0015835ce9739mr29699846plo.150.1651086571101; 
 Wed, 27 Apr 2022 12:09:31 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a056a001a8600b004fac74c8382sm19999983pfv.47.2022.04.27.12.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:09:30 -0700 (PDT)
Message-ID: <aef84ec5-c671-0a77-9fc2-3875c79c92da@linaro.org>
Date: Wed, 27 Apr 2022 12:09:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/9] Kraxel 20220427 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220427172952.2986839-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427172952.2986839-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/22 10:29, Gerd Hoffmann wrote:
> The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> 
>    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kraxel.org/qemu tags/kraxel-20220427-pull-request
> 
> for you to fetch changes up to a8152c4e4613c70c2f0573a82babbc8acc00cf90:
> 
>    i386: firmware parsing and sev setup for -bios loaded firmware (2022-04-27 07:51:01 +0200)
> 
> ----------------------------------------------------------------
> vnc: add display-update monitor command.
> screendump: add png support.
> vmsvga: screen update fix.
> i386: sev setup for -bios loaded firmware

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Carwyn Ellis (1):
>    hw/display/vmware_vga: do not discard screen updates
> 
> Gerd Hoffmann (3):
>    i386: move bios load error message
>    i386: factor out x86_firmware_configure()
>    i386: firmware parsing and sev setup for -bios loaded firmware
> 
> Kshitij Suri (2):
>    Replacing CONFIG_VNC_PNG with CONFIG_PNG
>    Added parameter to take screenshot with screendump as PNG
> 
> Vladimir Sementsov-Ogievskiy (3):
>    ui/vnc: refactor arrays of addresses to SocketAddressList
>    qapi/ui: add 'display-update' command for changing listen address
>    avocado/vnc: add test_change_listen
> 
>   meson_options.txt                             |   4 +-
>   tests/avocado/vnc.py                          |  63 +++++++
>   include/hw/i386/x86.h                         |   3 +
>   include/ui/console.h                          |   1 +
>   ui/vnc.h                                      |   2 +-
>   hw/display/vmware_vga.c                       |  45 ++---
>   hw/i386/pc_sysfw.c                            |  36 ++--
>   hw/i386/x86.c                                 |  32 +++-
>   monitor/hmp-cmds.c                            |  12 +-
>   monitor/qmp-cmds.c                            |  15 ++
>   ui/console.c                                  | 101 +++++++++++-
>   ui/vnc-enc-tight.c                            |  18 +-
>   ui/vnc.c                                      | 156 +++++++++---------
>   docs/about/removed-features.rst               |   3 +-
>   hmp-commands.hx                               |  11 +-
>   hw/display/trace-events                       |   1 +
>   meson.build                                   |  12 +-
>   qapi/ui.json                                  |  89 +++++++++-
>   .../ci/org.centos/stream/8/x86_64/configure   |   4 +-
>   scripts/coverity-scan/run-coverity-scan       |   2 +-
>   scripts/meson-buildoptions.sh                 |   6 +-
>   21 files changed, 458 insertions(+), 158 deletions(-)
> 


