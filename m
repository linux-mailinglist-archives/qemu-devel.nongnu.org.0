Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5E554AC2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 15:16:52 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o40Dz-0005R9-Fw
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 09:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasen.qin33@gmail.com>)
 id 1o3w13-0004AO-Lx
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:47:14 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jasen.qin33@gmail.com>)
 id 1o3w12-0002Wk-8M
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 04:47:13 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-317a66d62dfso95039947b3.7
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=u4DpukyCpkR/qggAbZxcqdj22gPzqIQKna6z0ybS6bk=;
 b=oa+ei73AQmJJX5quh8NFqQKbhLv4xDbnTPR3hK4ytWr/qopMwY4dYgKHJ7xP9tDk/g
 kFBTTRR1qyeVxLfUwgSvgC4ZQHLwyveKxzILsUNcw7leaHNMcG03DiMXrMZtIB2Jwuvw
 OCACBLPDNAI2CGJGR/+9IGs2eOa1p/3eSdqoS1KotfxBcQI/lmc3gRSKccJuibI/Aq5G
 B4lM5ANrYv2CXitaAT/JtyTgCLWF7tAglz86bQ5SOTQ9OiMcr0txx5SEzpasKSEhKfKi
 PqoZ0NX8h3XrdZrV55HgMu75Q159APm+21Gq5L5Eiuz+0im8eLpQZvcV+ias23gh4ILv
 nY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u4DpukyCpkR/qggAbZxcqdj22gPzqIQKna6z0ybS6bk=;
 b=6B49+Cy2BXKNHCIIUmIQOlnst2Xh4Bg+YFeR3iG073F+C8pn2fsxbetZLfkJn67pcW
 RROmaF82QHagEqdZ7GxY0qD+7IWzlOxglvyuMzIEO/wWp0yPVxKtEwoAEt4dB30FdUjV
 ZfH/MlhtuN1Z5EBSBK+lsqWAujdcmZbRqWH0Lv/HWLAOOrH4ek7SrNuiHrv3MmgeIsGl
 XIiapD82ep/V7JKHQJiolAx1JDVPAshNJ6tKRaP6YZo3QbDa5WtEcJGncc+kCo4Qn6oR
 J/Tzht/IhbX3W87zQOW0zWJ1M4S9LFn+3TnUhuVP3VTX8CyOeGsBLv2KczsHTBlooD94
 QCrQ==
X-Gm-Message-State: AJIora8/78fpSSjejTQfo5BTaHByTOQW/b/N82VctEwP6nbVee8vw5hD
 qdFCG9T3TZgj1/7DbuQYfs/VItASoiKxGnVYNRcWatzx
X-Google-Smtp-Source: AGRyM1ubmPFjLQHyJzpjxoX+A5xc43GAf/MNbJF3BJrWaAp9LA00Aj8zxg4pxAw507TcB2aj+JLs6yvg31cGuvNRd4Y=
X-Received: by 2002:a81:5d56:0:b0:317:8c75:7116 with SMTP id
 r83-20020a815d56000000b003178c757116mr2864495ywb.348.1655887628535; Wed, 22
 Jun 2022 01:47:08 -0700 (PDT)
MIME-Version: 1.0
From: Jasen Q <jasen.qin33@gmail.com>
Date: Wed, 22 Jun 2022 18:46:57 +1000
Message-ID: <CAPjW3et17+zkUJh+FnSMR02Pv54oqfAVKHPfPqjpkg=NhQbjhw@mail.gmail.com>
Subject: M1 host passthrough
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e30d0205e2056142"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=jasen.qin33@gmail.com; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Jun 2022 09:13:10 -0400
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

--000000000000e30d0205e2056142
Content-Type: text/plain; charset="UTF-8"

Is there support for host cpu passthrough for M1 SoCs?

--000000000000e30d0205e2056142
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Is there support for host cpu passthrough for M1 SoCs?<br></div>

--000000000000e30d0205e2056142--

