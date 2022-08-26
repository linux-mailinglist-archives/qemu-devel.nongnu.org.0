Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7985A2B3F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:28:58 +0200 (CEST)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbGT-0001Yz-8K
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRabH-000450-Ls
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:46:23 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:37443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRabF-0001Kz-My
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:46:23 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w4so968586qvs.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=T0YaLhvYxImjYhgoP+lPb4s1SUqgM6wDvDz/BejWXeY=;
 b=ZTeqCPEHf9LENdBkL8l5oAvCyH5OMnmYByrPVGBx1C3dk47GwPf5tfEpSO/I1vY/AN
 k5F6QM0JWpSh3M0hoI3vr1HuVyYhwVxscyu4xqK3N3Fz0lWB0meM6XhOcUDCKCxW0K8T
 wTQswSNmX1R0zxaAtifDZyfsEDl0iZHeOSCeYZnFZjmhvhL+ASCcOt+B80qScYhdr1WW
 Trhfv5Z+6qOECFg2iGaJf6HD77/M6aLOBsiIGkcIv/kP/vj1I8CBQc541HHp8641NDyi
 z1mHQXH/zNzB+M3L70CrYH8HkTBI0l5YVV3ICq091lx7POJYXUBLMyAbwSjIPZNLs8dE
 uQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=T0YaLhvYxImjYhgoP+lPb4s1SUqgM6wDvDz/BejWXeY=;
 b=thGBHQyaxMiszmV6eAsZyxWvH4gDVQgyjs1ss4NF3HFV08R/qAMH659shb0opuG54R
 oQuUvEupzM0EWidsJcOR8U8X9/tY91MbwSgJ5yfgHZYm5bXviXCP3IvVxtesHFBC/Uu9
 fhepFcXIXbuUfoucfwbbRw6hTix/NGz8NFHWHmEKXI+UpDIhwx17q0RjTae+iabr12ml
 yZrfQ/TNNg0V2zF4Lp9DW55x6jad2bcCU1VjUAhQ4peurjPbRAdkYVVIqu+/fwjsHKFW
 HKbwlnoe57/Duu4N/zH/8RlHhuSxsGyouvoEpdx03c8aEuCUz19GY80qSpHp3nWryltd
 K9hw==
X-Gm-Message-State: ACgBeo1Fis/DjU9bd85YkYLAjRC9BJxaTiPBmoPFeYDMNS4p4T7sppfg
 hUKEtzG6Fltr7/pbZXZGeYEr+L4UN97ZcCiownw=
X-Google-Smtp-Source: AA6agR7M3/SrEj6hayxbHO3l4M8dE9zdJPLH/DJy+S6n5LxAAitk7FxQ9JmHKWKWKtnxTUbzp2XD+GwJQ4Z8wNWO3f4=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr8321802qvc.12.1661525180568; Fri, 26 Aug
 2022 07:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-12-bmeng.cn@gmail.com>
 <CAPMcbCqVSx1Y59PH8d95QffCVfUqzUCeufiatsS79k+o4dckSw@mail.gmail.com>
In-Reply-To: <CAPMcbCqVSx1Y59PH8d95QffCVfUqzUCeufiatsS79k+o4dckSw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 22:46:09 +0800
Message-ID: <CAEUhbmWqA0K_nwoOMBmO4Unu19o0=S-n+f3Ba4-5SM+CjFjUTQ@mail.gmail.com>
Subject: Re: [PATCH 11/51] qga/commands-posix-ssh: Use g_mkdir_with_parents()
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf2f.google.com
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

On Wed, Aug 24, 2022 at 10:41 PM Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> On Wed, Aug 24, 2022 at 12:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> g_mkdir() is a deprecated API and newer codes should use
>> g_mkdir_with_parents().
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  qga/commands-posix-ssh.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>

I was wrong that g_mkdir() is deprecated. I must have been misled by
the GTK glib doc.

Using g_mkdir() is still fine so this patch can be dropped. Sorry about that.

Regards,
Bin

