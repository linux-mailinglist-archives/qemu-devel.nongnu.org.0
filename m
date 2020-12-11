Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1A2D7F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:42:23 +0100 (CET)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoJ3-0002OO-HR
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1knnS7-00047L-A9
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:47:39 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:37998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1knnS5-0002D6-OY
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:47:39 -0500
Received: by mail-il1-f193.google.com with SMTP id v3so9728288ilo.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Yk9POZQrXta7laSInqK3xRBkSTLCVOKxkT0QG7o8Ws=;
 b=Q+0xfjts+Jk7yY1Tjcfrr25p2Cvu6RQfQxRtpVqBbcaQIL2kcW0rI0OY8z7vWa2tGo
 r8ZoA3LERBYnGFVjHiWlLK53H4fYNzmuCIQ7tXGtmKeVFAeaQhZiw4DwLKIbTAvywHDN
 +HLWTEUzlr096o23LaTRRzLB7itTQT8+hQPaQTaP0P+70kbtpTZ1NJvNDpTxcCMxptoH
 0qMIiFafP59Ri60HOfSH09MgyKXbx5IHUQVWSSQZ5KyMqZNxxH0iuFtIEqcqcPaSumiV
 hVz+YmJ3YUJTJxjwGGfVqDUUCmmIg3t0oYE9LqFK9gNxgYl83PTOt0DZY+kRnd7D7Cjz
 opYA==
X-Gm-Message-State: AOAM532Z5sqpqrNCkp9bOncfEc9CNdHar/3nScNPE+Mh6wkQU+byaZNF
 I0rX966NCYBf4+rkIbxfEpALVWvr5/w=
X-Google-Smtp-Source: ABdhPJxwH9o4SVYR3V7QwazTVq2w7nrNJwyzzrq11JcS9WDG6XGrQ3g2+HTnnCkOBdhw63komRNkXQ==
X-Received: by 2002:a92:ca8b:: with SMTP id t11mr4735927ilo.115.1607712456220; 
 Fri, 11 Dec 2020 10:47:36 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id q9sm4811048iob.18.2020.12.11.10.47.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 10:47:35 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id y5so10479999iow.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 10:47:35 -0800 (PST)
X-Received: by 2002:a05:6638:f89:: with SMTP id
 h9mr17467959jal.89.1607712455435; 
 Fri, 11 Dec 2020 10:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-7-j@getutm.app>
 <6fb788c8-ac2b-83b6-8977-24652a05f7c5@csgraf.de>
 <CA+E+eSAznXzHD1u+a+X4kenbOzfEifzznXx0Qq6425ahjK7K_Q@mail.gmail.com>
 <781d6412-ff8a-ae33-3b00-d27e9fc9cd0a@csgraf.de>
 <CA+E+eSBf957VZ56HAOmK8dYJRrySjEJkNVCrzHZxUF81M4Gycg@mail.gmail.com>
 <37faedcb-5431-5f4c-b8b5-5dbe94510ae2@csgraf.de>
 <CAJSP0QVz4bA4uN0m0Qsv_x4vJdDeTQgmtVJSAPsV8Laqg2tEqQ@mail.gmail.com>
In-Reply-To: <CAJSP0QVz4bA4uN0m0Qsv_x4vJdDeTQgmtVJSAPsV8Laqg2tEqQ@mail.gmail.com>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 11 Dec 2020 10:47:24 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCS7vBULDO21ox+4SAtrMNKnqd_3vsUKtQm-H=UO4aLFg@mail.gmail.com>
Message-ID: <CA+E+eSCS7vBULDO21ox+4SAtrMNKnqd_3vsUKtQm-H=UO4aLFg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] tcg: implement JIT for iOS and Apple Silicon
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.193; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f193.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sounds good, I will make that change in the next version.

-j

On Fri, Dec 11, 2020 at 4:36 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Dec 11, 2020 at 10:54 AM Alexander Graf <agraf@csgraf.de> wrote:
> > On 25.11.20 03:08, Joelle van Dyne wrote:
> > > A lot of users of UTM are on iOS 13 (a large number of devices only
> > > have jailbreak for iOS 13 and below), but if the QEMU community thinks
> > > it's better that way, we are willing to compromise.
> >
> >
> > I think it would make merging much more straight forward if we could
> > keep RWX toggling to the publicly released API. So yes, please adapt it.
> > In UTM, you can still carry a tiny downstream patch that implements the
> > API through your reverse engineered code for iOS 13, no?
>
> Alex, you're awesome! Thanks for finding a way to avoid the
> reverse-engineered code. With that change we don't need to go through
> a legal review and it makes merging this much simpler.
>
> Stefan

