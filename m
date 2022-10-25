Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CB60D0E8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:42:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onM2d-0002RN-Hz; Tue, 25 Oct 2022 11:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onM2a-0001O2-FX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:40:32 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onM2U-0007wO-CP
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:40:32 -0400
Received: by mail-yb1-xb29.google.com with SMTP id o70so15072013yba.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zLl47yna3rXBF1xLCNhbuAF7E3cCfH2GLf9TTy4T2gs=;
 b=UtriefVV8FIS8IsC95lgnScxxBUMl5IRDEBJp/4BqsT3z9Ep1jEc6zhdO0tvMf7g1p
 BW+YU8wjPfmQemCOwvVCEE2vDcJ2mIJ6PpKwQzNuuBtwKkrGdVv6vLWCE9w0VQj/sCVL
 tr8CLhsHgAFyYK7TVKeNNRnIZ4zyMmrotGm/3pqdlP+I9gxa4Y3StupfDD43TQ3KVKyN
 lofzeztZ3p/8GB9ChKBCvSa/Dni+yBGBQD36YiFWSqgzssAIFoyY37SB67ymZVV3uBSO
 XEKucosan+oe9lY7cEyKlmm5wGWfhCR8Q/BDSRK4OkCp1zWYT96Nw66lJonChH2X1fIb
 6S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zLl47yna3rXBF1xLCNhbuAF7E3cCfH2GLf9TTy4T2gs=;
 b=kvlDJtYs9LA2Or1NDA1/0RZUd7D0pkxJVUGZ1N0FHy0LXdEkPIeFxNLLXKokdXItmU
 L8PEw0nBogr2SEEFu6jfr9cL1TI5yewMOUAJiHmkGcAG/F2+HjUDOHqgmjxSlr9k17zL
 YGryuO63YWeyb7eYwS+2jrUujhf3Ut9SkH6wC5sh7S8xY1BfC4fPDqWpf394yOqSkYKb
 cUoXrsYMOitdldwRxqKGUVWkhKMYRUGWDO7XciI/M1T+R/h21ULjt9uTzlMFC5dA3VX/
 XMi8YmQDxrPEjyT88MuazeZQxdQfp1G2nvBAbbyt4IxCaicPWBmUP0qczjq0fa6x9GpG
 4r0Q==
X-Gm-Message-State: ACrzQf1IX/2Pyw2MpU8Nj/UhveOKX7w3LAtVB6n/ZMagvq/6mtTM7w8Q
 QUV+8Ya01lUdhl/eYdotPnKopOKA4XhOphvK0qQ=
X-Google-Smtp-Source: AMsMyM6fcWfyt8emxrRi/1xBHgYYb/Mz8xiCSmm0Fl9D0Zm+zdNQcA6lb/Q7X5jW1GVuCN+6MX59YPrVOeDAwuud6TI=
X-Received: by 2002:a25:d210:0:b0:6cb:47d1:8738 with SMTP id
 j16-20020a25d210000000b006cb47d18738mr6895491ybg.207.1666712420267; Tue, 25
 Oct 2022 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221025080541.271547-1-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 25 Oct 2022 11:40:08 -0400
Message-ID: <CAJSP0QX5D-byMkpy0G_3rW-KXOKj=N5RDzTXTW_PazzHJYmtfw@mail.gmail.com>
Subject: Re: [PULL 00/28] QAPI patches patches for 2022-10-25
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 05:00, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit e750a7ace492f0b450653d4ad368a77d6f660fb8:
>
>   Merge tag 'pull-9p-20221024' of https://github.com/cschoenebeck/qemu into staging (2022-10-24 14:27:12 -0400)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-10-25

Hi Markus,
Please replace this with the HTTPS URL in future pull requests:
https://repo.or.cz/qemu/armbru.git

The unencrypted git:// protocol makes me nervous.

Thanks,
Stefan

