Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49D59107C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 14:06:33 +0200 (CEST)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTQt-0003rQ-Va
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 08:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMTAS-00033s-L8
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:49:32 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMTAR-0002mq-2f
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:49:32 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id k12so1093815ybk.6
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=daEDCujVTyKE+KSN6EG2XLk7AN3wYbRkIKbEMsQ01mo=;
 b=eop230Rl34OwDzVOSsd+/FYUgw9jJSAhmdn7PDwLdC/CX2rufzx1hHCaW5B6I9PqsZ
 NtWyCErkcl9eOzGldWjA3X0QMWcHFrXotdVjZgzrPToBywjnJZdvB5zVe4VAwRyFichg
 Y3mkS0zJknnlzQMFtQUed+hX6OLsI5k+cfOaHoBCLlVKqljJwao+Rni4SQ4DFSUNrbY9
 yPOVmlRrF8+zPPotiZ3nTqDnCCNKhjiWcmI7Wh6dgO3PEmDCG47t7R9xGDbZkzxPKX1u
 RriIbQB3fp8/WRDcfyz9P08vorYAAe+mKeM7uKVVqzRQy81zL6+UDeyttQhyp0tT9+se
 NoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=daEDCujVTyKE+KSN6EG2XLk7AN3wYbRkIKbEMsQ01mo=;
 b=73JsPDkW3FjZc7glCMNEgfqtrVCGaQjbvOH0LQAHq/R6s/5XHaaImPiW7n0go+rtvS
 y9Sweu/HfayvoTowZxT5FpSjnnQ3IwOwjcHD/ruhHC63BwAnDHORt/LzvbNRG7aUWAxW
 mXtLQUH0duBUrHoJhlRzKx7+DtlXGQMWBopfys6G2Jq8a5IsSd84LqbDNS9PSyJVn2lA
 hObmm+pfHgYQUlUdLhREkcyp3sTY/9nN1IvU4cxkcrYnLMxca0KyzwqUF0hnP1JCKjMf
 Chem/jkSxOCgyrf0CP3fNy+qdrwP/5Hp8RpPRiyyei6skh5FbJuDzGcCki5+IzietnFB
 FbBw==
X-Gm-Message-State: ACgBeo17xdL4LZ+hBLAOuS/txO/IrdWZ7zpu9oeqrJ+2Fj5m5svXhgGm
 GogbncLjg+vOaTvBTpuBY6KPNG1BSATjqVFl4ijgBw==
X-Google-Smtp-Source: AA6agR7B1ZMlGiBmjdEjG0grja1co/9ujtKJhu9HINs3WCfdySyGEacALB6GPDqqhEmQU+vLg5MsjaZHaSwQot02DBk=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr3136171ybn.479.1660304969988; Fri, 12
 Aug 2022 04:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660303075.git.tugy@chinatelecom.cn>
 <211833676831b86d70af12df9912aa971d46092b.1660303075.git.tugy@chinatelecom.cn>
In-Reply-To: <211833676831b86d70af12df9912aa971d46092b.1660303075.git.tugy@chinatelecom.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 12:49:18 +0100
Message-ID: <CAFEAcA-So11YhE=P2Xb2FXG4-dbG_gq2eg60O9q=ejh+bBC4NA@mail.gmail.com>
Subject: Re: [PATCH 1/2] osdeps: Introduce qemu_socketpair()
To: tugy@chinatelecom.cn
Cc: f4bug@amsat.org, marcandre.lureau@redhat.com, qemu_oss@crudebyte.com, 
 richard.henderson@linaro.org, berrange@redhat.com, mst@redhat.com, 
 kraxel@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 12 Aug 2022 at 12:44, <tugy@chinatelecom.cn> wrote:
>
> From: Guoyi Tu <tugy@chinatelecom.cn>
>
> qemu_socketpair() will create a pair of connected sockets
> with FD_CLOEXEC set
>
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>  include/qemu/sockets.h |  3 +++
>  util/osdep.c           | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 038faa157f..52cf2855df 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -14,6 +14,9 @@ int inet_aton(const char *cp, struct in_addr *ia);
>  /* misc helpers */
>  bool fd_is_socket(int fd);
>  int qemu_socket(int domain, int type, int protocol);
> +#ifndef WIN32
> +int qemu_socketpair(int domain, int type, int protocol, int sv[2]);

Any new function declaration in a header file needs a
doc-comment documenting what it does, please.

> +#endif
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
>  int socket_set_cork(int fd, int v);
>  int socket_set_nodelay(int fd);
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..4b1ab623c7 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -481,6 +481,30 @@ int qemu_socket(int domain, int type, int protocol)
>      return ret;
>  }
>
> +#ifndef _WIN32

If this function only exists and is usable on posix
hosts, put it in util/oslib-posix.c rather than having
it here with a win32 ifdef.

thanks
-- PMM

