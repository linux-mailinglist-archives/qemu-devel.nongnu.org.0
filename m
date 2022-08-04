Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66558A0FE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:59:49 +0200 (CEST)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJg4S-00019M-5D
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oJfql-0003x3-IZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:45:39 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:42979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oJfqj-0005aX-V7
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:45:39 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 199so440390ybl.9
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8SeWRB3y/Z9aDdI2nXCquDmgnbx3SEB7gZ839vxftqk=;
 b=m16lCzYOR7D6qo/p8jX0623yLmAqv8n1nOUeZnBDFzeyz79su89pWQzgWvAvfA8Q8p
 qeDk9AP5OagqcYiJozEaCkFVDN65hmH2APl4Lq7Mrw7P9FBjtfWKnBNibS3CyDO4e1xc
 sy8qyTGyVfHrvsNkNfwARBKuyGc9U0RSGygdb6eyowMIBOIqtjAUG1MGh+3NBNRXK7MA
 BTJkuBgywTj3oA5AKLP7LYIN+0Pcq69WmzW5M1mEJBGTuJc6DxqMdPnMqIoPd1mAt329
 Wd+Hk1XXCzT4y9b4e858fuB2eRaBpqCMKNVx/8eadQ9/dxYn1nnph/Ri5Dx1E0jLykvu
 5zXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8SeWRB3y/Z9aDdI2nXCquDmgnbx3SEB7gZ839vxftqk=;
 b=DnJZiyOT3jTmfRHt2ct5w5BGSqZOs8VCyV4OnlLL38XuBikyfWPcfESsGl+V2ZR8E0
 2IELY+1VFbH4EvZyo+41DIAHjAhsWthtcI0Zzr59ozKwyY5z8ETpLZg4obUNTCZZOcyx
 zD0nFDKTqkS6eKXxl6pQmBdbKrXP9rFCiqfNZ4mlEJS/yUgmmeQZMWpZ6VbAhNbTlask
 zt/qYx6stiIjVuCPfCfL2OJ+mA2gGhKjNRN9lfefBazH2ddU6/+EvqOXJ8B0Sj5z39Ia
 z3J03wu/x/M/9Jm2XbBIGYxdFmdPr/q5OSfBu16N/Gil+tixqtgNx0TKR2UfuN73aF06
 ik/A==
X-Gm-Message-State: ACgBeo0M9B6lf9DImS5CAsIJtg8LQAvBrVbYhLktfjGGvfjkcj0orrlm
 kccjMh26oEjSSbxRaybe0WoRbjwSMihURoBBEvU=
X-Google-Smtp-Source: AA6agR626qwrVEw+Hdnj4tun6/bpOnD2LF7rKlsDaITaByn6xU3h/q/dVOOSyggNIXAtvS+PyL0XRaz1DDagJdyYhzw=
X-Received: by 2002:a5b:c87:0:b0:66f:2298:4ed7 with SMTP id
 i7-20020a5b0c87000000b0066f22984ed7mr2425010ybq.207.1659638736586; Thu, 04
 Aug 2022 11:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220804074833.892604-1-sw@weilnetz.de>
In-Reply-To: <20220804074833.892604-1-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 4 Aug 2022 14:45:24 -0400
Message-ID: <CAJSP0QWPduu2rqti-=zviJwuHGamK=n1pd1xwfL5tamYJtNqZQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1] virtiofsd: Fix format strings
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, David Alan Gilbert <dgilbert@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, 4 Aug 2022 at 03:50, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I have also several patches which add missing G_GNUC_PRINTF.
> Would such changes still be wanted for 7.1?

Hi Stefan,
Thanks for the fix! I have merged it for 7.1. Please send the
G_GNUC_PRINTF fixes for 7.2.

Stefan

