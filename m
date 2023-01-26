Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6467D6EE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9J6-0002Ad-Dt; Thu, 26 Jan 2023 15:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL9J4-0002AR-BU; Thu, 26 Jan 2023 15:57:14 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL9J3-0000ft-06; Thu, 26 Jan 2023 15:57:14 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-4c24993965eso40102627b3.12; 
 Thu, 26 Jan 2023 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9fp5qR221Js1ug9dqi6qWixazlFUGfRttCyA6YXuo20=;
 b=iHzgoZTyPA4Qvbsmhoit0/cfjnCzsIwGwXx4inc9FyZcDOOkPuLSsieDKWk86wIn4T
 PIhZQRRAN3eze/WO7LucKZYfBm4w4xllPE5i0vLsglnlok1S5uFY2x2ox+1ry2PBYaeN
 Jkf++kT57VLVHrnzUf7PwFOaUDDVkT68QjQ8dVZoa7EkdJHQkT5SayDpR7pwpFFUCyNl
 0xGFkCppGqUWPzQfDRrcqYL1zOByQJ8slv63BOsKYLbgTBcisC+wfJFn9+rKfksvb+Uh
 zNGJClWqFnQubpCte1YDI+iYdxdU0muyTBqa41mjZ71kvg7DtGyr+Zf0CT4k/1QNJdBt
 x8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fp5qR221Js1ug9dqi6qWixazlFUGfRttCyA6YXuo20=;
 b=WwmJ45YFDZPJPs5teinzLkN25pHpnp6qJ1ti1DRLQLB9q4orVOMJP45B8ozZDKppz6
 DQyPZqWhdG2uy0AJJdwVonQuGewdoUBI4XAP6Pyh8ETSGXadoox87m28O+vLbsrtzuaC
 ZjCK1p7eEDbgH2/2MZa4rC8uvJ8KyPHBFVonMj69n0rCs1oxc4Ex8SDENXrUDxuH/2ts
 XowOqapI/FMEQGqxyB/Faf/X5K0pAc8cPGA860dBZkb97CK08MJdMxAVx9SiO9Y2hORI
 e13+0cd68FTZY4MqiIKaLahfEMqOOhF2Y2pCingrHjp+rZIjc9D1qoiaSdaNQQKYjZUO
 yf4w==
X-Gm-Message-State: AO0yUKUzROC0WSiW/jWm48aCNrVEljokyzEQx2oAHcABM5kVsHzDNF3A
 9AZUMBMueyfrXMbpoSn8LWWUmWV6x8+xNPv4v5AGYlVl
X-Google-Smtp-Source: AK7set8Ai4D0SKPeGMNkS464x93t/G3U+mCL4vP8720VK45aUZePfgj1fWT1QKnF6JaYjko5uZjDf9Yf2J4ngohuhi4=
X-Received: by 2002:a0d:cc46:0:b0:506:65ef:ba9d with SMTP id
 o67-20020a0dcc46000000b0050665efba9dmr1080285ywd.156.1674766631551; Thu, 26
 Jan 2023 12:57:11 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QV+snj62LnD35WVA05s0msRr-xxwkfYKMb-eGTnffLwDA@mail.gmail.com>
In-Reply-To: <CAJSP0QV+snj62LnD35WVA05s0msRr-xxwkfYKMb-eGTnffLwDA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 26 Jan 2023 15:56:59 -0500
Message-ID: <CAJSP0QXjv2sGMZfuL5Qhct48dM+NYavOVrChjRE_MkjtwpR29A@mail.gmail.com>
Subject: Re: Migration of download.qemu.org server in progress
To: qemu-devel <qemu-devel@nongnu.org>, qemu_mail <qemu-discuss@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SSL is working now.

Stefan

