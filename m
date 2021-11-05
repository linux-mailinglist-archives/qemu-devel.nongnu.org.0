Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDA44685F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:29:19 +0100 (CET)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj3xl-0004AK-SO
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj3vQ-0002kT-JD
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:26:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj3vJ-0004kp-PI
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:26:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso10170354wmc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NgQ0RzfrgU0nGW+uBs1HaSoa53VTfdkipbXgd6AGbRY=;
 b=meijCwsiBOLbDqhCu7mIYfvqwMAP2tEoO9oPLwIOyBg1vXJgJ4BYH1dXt+FchnzY4j
 g3N2XJnP3/nTA8WHJYEEKan4tc3EsatonJzQpPKHXzpDiiudVkFLtO4ziAO93VfhaZNZ
 LcSXhphmKRMJZ4VCxkc6lFPDRjqI+zDJiDN5N45QLBOQfebEAtIEM+KugDEOExVW/CIz
 adYLL67s4NVKfgj9UrXHcTWq3h0kj0Ayfn5jChNV4UWNhvv1ztudAe6aIaFueQN1kfre
 bC7iOYmC0XDAPItWoPLlSTNkbsYPpdSmWMEDbKla2jCF+hWyp3V55GTh/UjDHBMJn3Ne
 LP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NgQ0RzfrgU0nGW+uBs1HaSoa53VTfdkipbXgd6AGbRY=;
 b=Orvl7zD0vx1Vuwu0zpOAlvcR+pkMpIhcHcWLzTo5kYxBZA1Kzuz956MMJRw3BuUVQK
 XReq8TkM6DM2P4a0SuAs5ctst2hc1u3gAf5mWMFbxx1Da/YYEQ27ypYkfD9zWwYzgoYa
 dhEtZhM8h0WU7TD4Le0dHPW8mwa5VzcfDqpaP3j5kqzTH8P0g+wSNZZevKDZt/B0k08u
 m9y2K8j6gXLMuAJ6jKu1SFjLJsBD7CwVAbYl9l9cuh8mcCJxaSDh36nDVeqQwxbJBKai
 JIGXU/JEFcSHRD0r117gaPZsIWB4p7c4JyXpGkK+BEpstHHBrQeaG2ldiYMylarRrp/F
 09cg==
X-Gm-Message-State: AOAM530Gtxtwl0oy2lbFTpZjPikCy+4Q+GURRnNb7pBaSDvH5IwTnUcQ
 IGWGQlAjeuK1sg10RxNlI7I=
X-Google-Smtp-Source: ABdhPJz4wbecuvmZ/+crL42w1Oo6rzjlA5N2Q64i6PTTr1UOqmURK621RdrO5P6xG0cnVzsCVg1XMA==
X-Received: by 2002:a1c:3504:: with SMTP id c4mr31933628wma.160.1636136804311; 
 Fri, 05 Nov 2021 11:26:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x1sm8189895wmc.22.2021.11.05.11.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 11:26:43 -0700 (PDT)
Message-ID: <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
Date: Fri, 5 Nov 2021 19:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/6] Egl 20211105 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 18:13, Richard Henderson wrote:
> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
>> The following changes since commit
>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
>>
>>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
>> into staging (2021-11-03 13:07:30 -0400)
>>
>> are available in the Git repository at:
>>
>>    git://git.kraxel.org/qemu tags/egl-20211105-pull-request
>>
>> for you to fetch changes up to 1350ff156b25be65c599ecca9957ce6726c6d383:
>>
>>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>> (2021-11-05 12:29:44 +0100)
>>
>> ----------------------------------------------------------------
>> gtk: a collection of egl fixes.
>>
>> ----------------------------------------------------------------
>>
>> Dongwon Kim (6):
>>    virtio-gpu: splitting one extended mode guest fb into n-scanouts
>>    ui/gtk-egl: un-tab and re-tab should destroy egl surface and context
>>    ui/gtk-egl: make sure the right context is set as the current
>>    ui/gtk-egl: guest fb texture needs to be regenerated when
>>      reinitializing egl
>>    ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>>
>>   include/hw/virtio/virtio-gpu.h        |  5 +++--
>>   include/ui/console.h                  |  4 ++++
>>   hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>>   hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>>   hw/display/virtio-gpu.c               |  4 ++--
>>   ui/egl-helpers.c                      | 25 +++++++++++++++++++++----
>>   ui/gtk-egl.c                          | 10 ++++++++++
>>   ui/gtk.c                              | 23 +++++++++++++++++++++++
>>   8 files changed, 79 insertions(+), 17 deletions(-)
> 
> Applied, thanks.

Ubuntu 18.04.4 LTS:

ui/gtk-egl.c:159:13: error: implicit declaration of function
'egl_dmabuf_release_texture' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
            egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
            ^
ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
[-Werror,-Wstrict-prototypes]
2 errors generated.

https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737

