Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B160821B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 01:38:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om0D0-0004AG-51; Fri, 21 Oct 2022 18:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1olyP1-00005i-Em; Fri, 21 Oct 2022 16:13:59 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1olyOz-0006gz-Ub; Fri, 21 Oct 2022 16:13:59 -0400
Received: by mail-yb1-xb29.google.com with SMTP id y72so4535098yby.13;
 Fri, 21 Oct 2022 13:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gWD5WqewnwnwH17FeN2kqNozNa4aisIqbTT9dm9FTog=;
 b=UMO1+TuyGR/vgDd8F/S6YNAIdGp2wj/kw1bryMrv/9kjiHtwteVpsVQkjnWDg8IX2X
 volBEQflw9mvpqAKJSEmbzijhKnPFSv4iMDaZcXj08SQPcunNA29xhVpq1QqcBSVtBTM
 iAriu6zi5i2u/zAfyyr8dPDc+4geHGKD3WjyIv18Nj9MNp0vBT6rW+fxnu6Al+wUYcXz
 KzVTEO9Ocod1C9WnXeRMwkOFAble7Ufgy0ehBgaF1ACdUKyf5ymoAKWgNzqDpwyL2/hN
 JTq6Q89PkKGxOo3aSecldbr9coa4KoSqgcnm21deRwdCkdM/KkzFpy96VF6k4NkMuoZT
 avdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gWD5WqewnwnwH17FeN2kqNozNa4aisIqbTT9dm9FTog=;
 b=FsEcgd1w48tzMD7xhaqSZh8Je+IPjqtSm7eJneVnpZjpzBJHr01Vh5ia2rUfjSr0tn
 p3yqVxyLf1sd8K6/73IJLspElUdeJOOxAJkBTUH7Z4X5v/RFCoy/M/SVkIlaCZK2QWro
 54gP9qR+dR1Fb+5nVJd7d8iqcGVAXJEY7cBDh9shXhmRsZTMizO+4jNTr0QezXq5opEf
 udO4ILup53mqBSYa+BBrBMYDNqhEw19YFMmvRl0Mc+yH+Pp83n9SK0jchrilKVW51zMr
 7Fi6QHal4lMjhF3t/3VDoq0PcAzojPmSDsOMjWt7vkvq4NJKPlFfpsQAwfvUh0bR+Iv9
 VlzQ==
X-Gm-Message-State: ACrzQf33I1qOzXByEPW8TS6FdCrzuglHKdxU4F234V5XYPX1qL0Yt773
 UIbxHRURNO27ls9hd46nk3uI2WWvIRPq7k8rnKs=
X-Google-Smtp-Source: AMsMyM4i+WU4w3M0m4cgFN2pXOXSXvNbu+Rdz6ac47/tZGy2mt8WXdtIFEPU7IoifcmrJC3wyA1TFnPJG4JFlvewxZQ=
X-Received: by 2002:a25:4fc1:0:b0:6bc:c570:f99e with SMTP id
 d184-20020a254fc1000000b006bcc570f99emr18229491ybb.58.1666383236120; Fri, 21
 Oct 2022 13:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <Y1LA2qoQEoQ+bNMG@invalid>
In-Reply-To: <Y1LA2qoQEoQ+bNMG@invalid>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 21 Oct 2022 16:13:44 -0400
Message-ID: <CAJSP0QUE_mQc0VnK6_GwbAwNLzEeHyYYwrxYWHaTrSCj120How@mail.gmail.com>
Subject: Re: QEMU Advent Calendar 2022 Call for Images
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 libvir-list@redhat.com
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

On Fri, 21 Oct 2022 at 12:45, Eldon Stegall <eldon-qemu@eldondev.com> wrote:
> We are working to make QEMU Advent Calendar 2022 happen this year, and
> if you have had an interesting experience with QEMU recently, we would
> love for you to contribute!

Hi Eldon,
Count me in for 1 disk image. I will find something cool and check
with you to make sure it hasn't been done before.

Stefan

