Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324596D6FD0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 00:01:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjohS-0004Xj-Vd; Tue, 04 Apr 2023 18:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjohM-0004XO-UX
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 18:00:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjohI-0001Jr-CB
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 18:00:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so34323384wrq.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 15:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680645607;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G8wi6niKdb0i/F4cdC05yUACNJ/HbvyHgDVqgrK+EO8=;
 b=Ce0lKcgYXcyJRUkKTLOdCTrI72GNH2ncgjQNYMJGvQVUZG1JQo+Yy9QG1qg27qpldx
 vpFZq2UO7aau61n2V87xjcHw7X3aYFoTYoR6gTzhsiDJvKe5i3m4FC8YiQ5epBkdb265
 lb2epxfPizSIuVVTmgiLjl+AhkzNPVMGIaFlHMke1/E3lBFsxSWUk2re4qLZlacMdLbY
 YslwIx3iSBNNn04xvWncrTZGk8fF4Ua2lPB24KtAeDsyOFBH6Y5wM4lbx0/8xDQ6yzko
 pPFaiRUZiillYjSLW5dH3TLs/vDrhktsARJ1X+x/obKv0PFTm9YchgmYYMBYhTlUc0xh
 oS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680645607;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8wi6niKdb0i/F4cdC05yUACNJ/HbvyHgDVqgrK+EO8=;
 b=omxJGo5d+pvEbIMiBb7QFYlJj8KPnraq4Vo7JneCTbvsIxrp92x/brC2cHdqmUSYTi
 ZV5/58h1kW+hp1pmDOtofkenDYIV8FGR1ZnwrpLj/5rDLo/J74Bn324SlGGvBT03Gckp
 iR5Kpi2hSRFABlpXbYZ7B2iYcQTd1nWoK86V+Oq5ujscKwSnRx20afSbDUxQvIFBGj7A
 n8PYnZ0ZyNU2Je2egchL+CpCJ7OaX3yd9/kS5nTPB1jQJRIMbMw0fzXFgmWqEVXSo1L3
 xdmV9rQ2PSKMuyI9TcRJe9SOi7T9qA/cOY4zVFKHK+Iwx2rDbsvjcQLap9quJVAxoSMI
 jXHg==
X-Gm-Message-State: AAQBX9fgGGGCZ5uVVdFsFaOF1Bma3Hdkp/rNpPo8vGgW80/Bs//OG7+9
 j/CBIHdq4hsNICF5/gwj3TLi7g==
X-Google-Smtp-Source: AKy350bp0uYc2QAny3XI2FcpCIniCTIPnxSplQz+xre7Yij6MyDfj4SuFDaeORvnJryqUBLb3qEWFA==
X-Received: by 2002:adf:eeca:0:b0:2c7:adb:db9 with SMTP id
 a10-20020adfeeca000000b002c70adb0db9mr2624384wrp.63.1680645606767; 
 Tue, 04 Apr 2023 15:00:06 -0700 (PDT)
Received: from [192.168.1.101] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 r13-20020adff10d000000b002e45f6ffe63sm13241781wro.26.2023.04.04.15.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 15:00:06 -0700 (PDT)
Message-ID: <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
Date: Wed, 5 Apr 2023 00:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] tap: fix net_init_tap() return code
Content-Language: en-US
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 18:00, Steve Sistare wrote:
> When net_init_tap() succeeds for a multi-queue device, it returns a
> non-zero ret=1 code to its caller, because of this code where ret becomes

Indeed g_unix_set_fd_nonblocking() returns TRUE on success.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only current call
> site checks for negative, rather than non-zero.
> 
>      ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>      if (!ret) {
>          ...
>          goto free_fail;
> 
> Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=0 is returned,
> and the caller will use a broken interface.

We should return -1 from free_fail, not trying to propagate 'ret':

-- >8 --
diff --git a/net/tap.c b/net/tap.c
index 1bf085d422..e59238bda0 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -821,3 +821,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
      char ifname[128];
-    int ret = 0;

@@ -896,3 +895,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
                             "the number of vhostfds passed");
-                ret = -1;
                  goto free_fail;
@@ -904,3 +902,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
              if (fd == -1) {
-                ret = -1;
                  goto free_fail;
@@ -908,4 +905,3 @@ int net_init_tap(const Netdev *netdev, const char *name,

-            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
-            if (!ret) {
+            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
                  error_setg_errno(errp, errno, "%s: Can't use file 
descriptor %d",
@@ -918,3 +914,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
                  if (vnet_hdr < 0) {
-                    ret = -1;
                      goto free_fail;
@@ -924,3 +919,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
                             "vnet_hdr not consistent across given tap 
fds");
-                ret = -1;
                  goto free_fail;
@@ -934,3 +928,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
                  error_propagate(errp, err);
-                ret = -1;
                  goto free_fail;
@@ -948,3 +941,3 @@ free_fail:
          g_free(vhost_fds);
-        return ret;
+        return -1;
      } else if (tap->helper) {
---

> Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>   net/tap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

