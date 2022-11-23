Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958FA6362AD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrGV-0004zU-Dq; Wed, 23 Nov 2022 10:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brownie4597@gmail.com>)
 id 1oxnTT-0003Bh-Nr
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:59:27 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brownie4597@gmail.com>)
 id 1oxnTS-0006cp-1e
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 05:59:27 -0500
Received: by mail-vk1-xa34.google.com with SMTP id g4so8546633vkk.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=l7T4mIThX91V6g/6i/bLMSqEmNdsxxW13MifZ2xtPTY=;
 b=lpS0tki7Myr8AJ3IpoG+Md80GEETtH1FsaybUsswhneo06+cCyuEfwfeOcFDO6/6TV
 6fjxzhDkobxcrrczi1yZeTQ4mp7/xEAb8GHsFGAj27U1qTYRSZY4V3ey+2Y6SgCEBTPR
 xC7wYaTu/v5wMO2/ZWVgVBa4w7b2KuKcEERso4XG5ORlP1u6Q5ex7et9Hsr+YqXh8f2a
 dOsxkr8C8Cb6x0fIbd2unsAHvSzI34qjPUzUiQRUlV4Q1EG9rJhHhCxcn7feS1+QgDJT
 Ua8htBgD2iVe3a0FgXcLH7kO+x3BBFylVf6pA5nl3E/m+II81XUlcgyhNIuafsddS+R9
 crSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l7T4mIThX91V6g/6i/bLMSqEmNdsxxW13MifZ2xtPTY=;
 b=NJncEFeIOmYWR39EYXB42tgsEh0SIixgLb9ZbelcaPHMR8IYU6o0kWcZfQ70La7H+D
 POCvLaZPaliWU15Otjgq+Z1Wna3xEow38dw8MBya86ODY4WJGefr3Z+T4w18SVe5bzZM
 9rn5JwUS8PT8bxICWepjhF7c4p+FzicwW8t2taZ4OkLN6yiA5NrXHr7DjHY4iAGKgY14
 KnKOh1pTUjx1VhQi5ULwZ1oofgIvZzUZJXscE07JnnyHGz9lORccsbu+jVtUhDut5qEE
 +EnUEbDbM1F0WOIv3QF8ICXXEAgAMVUVzDhr2UUSq6xVOEDTB9z5/hd2KIHXESi4MmjL
 Beig==
X-Gm-Message-State: ANoB5pnsIeNbhruHQuRQ+5f5Uq2DVyhz37lNW77JSISByiWdYo1zFw3D
 nVxZ4X0OD+Kg8evZRnpsJS3qW8aU71948pRLzBJDynuiYMw=
X-Google-Smtp-Source: AA0mqf6BZJlChXMBRcOFVd7LW0RFhlCXjMCQwevawf6286aH4Vhyk0rMHDoJ83Um0WJPyehnCZoLol9V4BDhET8bMew=
X-Received: by 2002:a1f:2c01:0:b0:3bc:6437:d187 with SMTP id
 s1-20020a1f2c01000000b003bc6437d187mr5771282vks.41.1669201147245; Wed, 23 Nov
 2022 02:59:07 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?64SI6rWs66as66eo?= <brownie4597@gmail.com>
Date: Wed, 23 Nov 2022 19:59:00 +0900
Message-ID: <CAHtVSRkoJsgtfFasqU05uaB++Kt9Z_OTcQzkkJQT27VtpDQbPQ@mail.gmail.com>
Subject: [QEMU][Question] Is there any way to backup a dirty-bitmap that can
 be executed at the other server?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000070b93305ee212d34"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=brownie4597@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Nov 2022 10:02:15 -0500
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

--00000000000070b93305ee212d34
Content-Type: text/plain; charset="UTF-8"

First of all, Thanks for the hard work.

With QMP, I can backup dirty-bitmap - like 'blockdev-backup' incremental
sync mode.
But this command should be executed at the host where the QEMU process is
live.

I want to execute a backup at the other host so it does not affect running
Guest.
- `blockdev-backup` preempts the host's I/O resource.

Is there any way to backup a dirty-bitmap that can be executed at the other
server?

Thanks.

--00000000000070b93305ee212d34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">First of all, Thanks for the hard work.<br><br>With QMP, I=
 can backup dirty-bitmap - like &#39;blockdev-backup&#39; incremental sync =
mode.<br>But this command should be executed at the host where the QEMU pro=
cess is live.<br><br>I want to execute a backup at the other host so it doe=
s not affect running Guest.<br>- `blockdev-backup` preempts the host&#39;s =
I/O resource.<br><br>Is there any way to backup a dirty-bitmap that can be =
executed at the other server?<br><br>Thanks.<br></div>

--00000000000070b93305ee212d34--

