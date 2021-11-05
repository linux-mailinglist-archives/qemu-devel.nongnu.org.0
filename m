Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37C4468A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:53:03 +0100 (CET)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4Kj-0004Lx-S8
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4H5-0002RL-Pe
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:49:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj4H3-0002zf-Sg
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:49:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id o29so4012674wms.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=o3qcP0EQjGmpWTvVejj13btwWT7VxM1ngPtXi/IefGo=;
 b=SNlrXH5qmFf45mAsA6TbMuVT7ewGGX1t5OypXAOi9F60brURbz7rGs1zPByI7uAN+v
 5Zt2zDa7AtxFsQ7u3bTM99P6CO919IdYV9C1J9uOcbbbgdFYHDkqfl5ww6i6NNKMMR5u
 d2qOEYKB8OVKXOgBhCQDP9UgjL9Ffcm5cMqBSJJmIZpc6A/Gx4E4ESLSgEdb4EI31aMP
 5a6V4LDxUV3s+vti5O7P1Msl1MTcpGFCRm6b/3CiY92znrf29NloiN2w33dFw1AwbWV7
 3GH73XvTjMJYC0YU1madOLJXQUdhY5v7K34WR1jGi9EFe0KFCSvYv4AIsGVhtNBJ//0u
 AnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=o3qcP0EQjGmpWTvVejj13btwWT7VxM1ngPtXi/IefGo=;
 b=4NkVY3AYbeOWtg8Qiv4EPHkrM7lBnPrJFh0+ApvDORf0IaITCD+RbqhBgF4PyVtpjV
 db++fyjAT4Vja6eCU1u7NEYweC9pUryvYW0VucZbMFbhZRRz5s0pRstWLyLDGxHh0WTw
 pi0ioHqn4PaiNeG2cD8IUI2m9WukOaeajTgU9oPWrEwYUqSOjbknG9TRCe/IWrIYHUmC
 xFG88Y0sf8zV3bAbInG25gOPKWypfs9txcP1+zxe6cJfzWofQN4I3+i3BG/Y2ZeDfCSW
 nSk1wD2L8wSrAVZNst0sChm398phJALLVl+bZw2jBUV2tNMpxbQ7dpCJLh5yJQeXEqpr
 Jncw==
X-Gm-Message-State: AOAM532iJ676H7XzfaBZVVnZgWTTCUqSIpICDfUReUun2CDPuN8P7cdK
 u3Wc+26xSepKbQYpwb6V43U=
X-Google-Smtp-Source: ABdhPJwnT30L2wSwiQTg+8y/NAOg2+Xg5aC/2YtmZmX5X4L3kkq63bOniTfgpRLoty1U46m3WN4Ihw==
X-Received: by 2002:a05:600c:1989:: with SMTP id
 t9mr4878333wmq.24.1636138149314; 
 Fri, 05 Nov 2021 11:49:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q4sm8741510wrs.56.2021.11.05.11.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 11:49:08 -0700 (PDT)
Message-ID: <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
Date: Fri, 5 Nov 2021 19:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 0/6] Egl 20211105 patches
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
In-Reply-To: <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

On 11/5/21 19:26, Philippe Mathieu-Daudé wrote:
> On 11/5/21 18:13, Richard Henderson wrote:
>> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
>>> The following changes since commit
>>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
>>>
>>>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
>>> into staging (2021-11-03 13:07:30 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kraxel.org/qemu tags/egl-20211105-pull-request
>>>
>>> for you to fetch changes up to 1350ff156b25be65c599ecca9957ce6726c6d383:
>>>
>>>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>>> (2021-11-05 12:29:44 +0100)
>>>
>>> ----------------------------------------------------------------
>>> gtk: a collection of egl fixes.
>>>
>>> ----------------------------------------------------------------
>>>
>>> Dongwon Kim (6):
>>>    virtio-gpu: splitting one extended mode guest fb into n-scanouts
>>>    ui/gtk-egl: un-tab and re-tab should destroy egl surface and context
>>>    ui/gtk-egl: make sure the right context is set as the current
>>>    ui/gtk-egl: guest fb texture needs to be regenerated when
>>>      reinitializing egl
>>>    ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
>>>    ui/gtk-egl: blitting partial guest fb to the proper scanout surface
>>>
>>>   include/hw/virtio/virtio-gpu.h        |  5 +++--
>>>   include/ui/console.h                  |  4 ++++
>>>   hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
>>>   hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
>>>   hw/display/virtio-gpu.c               |  4 ++--
>>>   ui/egl-helpers.c                      | 25 +++++++++++++++++++++----
>>>   ui/gtk-egl.c                          | 10 ++++++++++
>>>   ui/gtk.c                              | 23 +++++++++++++++++++++++
>>>   8 files changed, 79 insertions(+), 17 deletions(-)
>>
>> Applied, thanks.
> 
> Ubuntu 18.04.4 LTS:
> 
> ui/gtk-egl.c:159:13: error: implicit declaration of function
> 'egl_dmabuf_release_texture' is invalid in C99
> [-Werror,-Wimplicit-function-declaration]
>             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>             ^
> ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
> [-Werror,-Wstrict-prototypes]
> 2 errors generated.
> 
> https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737
> 

This seems to fix but I have no clue whether it is correct:

-- >8 --
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index f2026e4b5c9..45cb67712df 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -156,8 +156,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
+#ifdef CONFIG_GBM
         if (vc->gfx.guest_fb.dmabuf) {
             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
             gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
         }
+#endif
     }

---

