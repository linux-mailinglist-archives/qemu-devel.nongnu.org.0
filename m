Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1617E613DB0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZpP-0007QL-CH; Mon, 31 Oct 2022 14:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opZpM-0007Q3-3T
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:48:04 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opZpJ-0002MK-IV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:48:02 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g127so6203699ybg.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bEHoyvz9nUZeviNKGMqVq2q2h0A8gk78ofl/F89j1uc=;
 b=CN61TKkQZn/9DfS4SsZ4seFwdndlgp7MDrHn3keU+Ok2wpsX4gX198x+0ZSuQz1Zfk
 Z58MGQoou1GPqucE+YvfJ0I/RQJXicy3aGdVQuWURf8caQf1PulJ4ND6sXHpZ+1RQwqC
 F5vNTVu1ZOAgFGX3MjmJ1xapOW3VMzJUBnJNFeIb+Kg388IPFiIr9GXOUOTWk9005V25
 h7sdqxdUQSXRZWOVaVvzlv+fTAxLIyE0l414mZkpMdENGi211Sl9QITVNStUEQ9DPISg
 wJXDsQGGnZ3nZpvKJq0cUvzc8m5k8hAs4AnTLskTQKTLq+J9qAu83/gdend0+toWoU+g
 XPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bEHoyvz9nUZeviNKGMqVq2q2h0A8gk78ofl/F89j1uc=;
 b=GaTWZyG4T4qx3QHFZ/PTgQ4+05G/d3R0gd5A/ooWTaFT9B6jFtdLxzpQohJ3tL4oxF
 f4zMgD2/Yc1uUVRrlJAKi+v45o+/IbxFgm4x66NfJzabxs/OxnK7Jb34HetyBq/OqfQB
 MFyIq2PuzFZN4E8fB5uLyQO7a6D4oUhLMJacrkgWUwO+R8fw7rJc+ucHf7hzmc3DfdKh
 qdQf0EQ5nhMaE8WOkpyFtHvwsKNLg8wkTw2x1LERVpMYYXz0Zd3m4vFd5xIeIs1sij16
 gm+j8rbvMjHD/vdRVR877hjSHEYtSQKrNYeHb+7pdD4kTcIveak50SfT4t9YvvqMXLwu
 171A==
X-Gm-Message-State: ACrzQf3LxotKsrcn0oMhhjgNINgqHTvEza8rcWpQ2UA2WLKGyA7O/nWI
 70UMQvIFEe1hmtvgMlNEm6/J7ZXHCafp0tQeLuw=
X-Google-Smtp-Source: AMsMyM7dd74SjQm9/NTRWXzhA86oh+sJk+U73G24+BkgD7fbLcSTWwUidp3Qf3xSdh+Q4tmk6Aw7copT+wtzjP5Elrk=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr15459705ybt.118.1667242079569; Mon, 31
 Oct 2022 11:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221031131010.682984-1-alex.bennee@linaro.org>
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 14:47:47 -0400
Message-ID: <CAJSP0QW2AP-wujB7yftn=JMvGto1iMm8g-=zwc1PhptagRqNyw@mail.gmail.com>
Subject: Re: [PULL for 7.2 00/31] testing and plugins updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Please rebase on qemu.git/master 5107fd3effb1 and resend. There are
conflicts with previous lcitool changes. Thanks!

Stefan

