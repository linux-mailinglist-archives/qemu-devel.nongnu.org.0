Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2D41DD82
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:31:38 +0200 (CEST)
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy25-0003Vv-82
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mVxmJ-00055J-16
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:15:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mVxmC-0006I6-PV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:15:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id d26so10671035wrb.6
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3Lorjg4DkfHVI/bKmKwdue4k8cd4ebKAxAry4ybOEJI=;
 b=vOZdDXxC+fBmktW4Tmg7H9YE4fV0yXk1oGQD7AqVPCCaP31z0FHTcOfD6Mirsf7+2Y
 ON5NKe+IppsdUeErHZ9Uy4Xh2aeGjt8FAD3IbsnwHFlpedVyi7pW/vwB+sM8dNjAWsOj
 4irTnA+95Y24vl23dLY5F/FVj1GLwjSMtsPk+3+lP+Mbv3WGqm8pSOKVg1aIfliTzB7O
 IH5QJcm2SzLFHFyOO4JVulsrI1bMBCvXSIT5NHD09IUYOTm1o8PqtavtOCQJcCGnygI5
 mcVrbsqWNYHDgVVuQF7C6bgCXBQsSg6NJfNsSMa/9WVOUTH9EqgVV6ovhuoHmuv18CrU
 pwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3Lorjg4DkfHVI/bKmKwdue4k8cd4ebKAxAry4ybOEJI=;
 b=VQX4F3S/6ht1KN9ZoO99bFp/z6iKKCkIePH2prf9L1rxd23N03WxXixhCNJf5kxg5w
 XYpsrcUZXVA+z4+klROcTybGRQZDYPqz2xIfIXdlvIl2IfgwlI16/Fjw7S+T6b5D9p8C
 q7sQ06afIU3Ym2Ikb2NfNLBrWW4X+GDhklR518mu6oIDuCiGZEXylfC1b908okfwFQ/+
 d48cjXOiVXYN/1MezVH34d297b4cLv89w9e3xK0xol6g8/qAJyM776jrrzkFFAz3E24h
 ltglSdjzQ9BDzt/GeNgYmk6OiR64B7Rj6qPsPqRqjI9rVnCS1uPOjX40bHAqU78x3Ize
 QuUw==
X-Gm-Message-State: AOAM5302s3edKFnkGs4LXnPLAdVjO7dkA1Jh/NSnndyY37Wz56RPswDU
 1vOLhXif9mn7gZ8vWTI3kgTy1Q==
X-Google-Smtp-Source: ABdhPJzdWx2j06I6hJLPy3zY4zM8y8Jz39oJXOED8iJViKd0YBEVHDW1IBkXQ+mHfZNSHyXWpvidcA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr7013100wry.292.1633014910305; 
 Thu, 30 Sep 2021 08:15:10 -0700 (PDT)
Received: from gmail.com ([2001:41d0:fc88:4700:250:b6ff:fe1f:8e7])
 by smtp.gmail.com with ESMTPSA id h18sm3213977wrs.75.2021.09.30.08.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:15:09 -0700 (PDT)
Date: Thu, 30 Sep 2021 17:15:08 +0200
From: Remy Noel <remy.noel@shadow.tech>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Strange qemu6 regression cauing disabled usb controller.
Message-ID: <20210930151508.mhdkotqv2bcwy6vt@gmail.com>
References: <20210930134844.f4kh72vpeknr2vmk@gmail.com>
 <YVXSUExueN0MpEDG@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVXSUExueN0MpEDG@redhat.com>
Received-SPF: permerror client-ip=2a00:1450:4864:20::433;
 envelope-from=remy.noel@shadow.tech; helo=mail-wr1-x433.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FSL_HELO_FAKE=3.096, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 04:05:52PM +0100, Daniel P. Berrangé wrote:
>On Thu, Sep 30, 2021 at 03:48:44PM +0200, Remy Noel wrote:
>
>Co-incidentally we've just had another bug report filed today that
>suggests 7bed89958bfbf40df9ca681cefbdca63abdde39d as a buggy commit
>causing deadlock in QEMU
>
>  https://gitlab.com/qemu-project/qemu/-/issues/650

Thanks, although, in this issue, the deadlock seems to be caused by the rcu 
while in the usb one, it is caused by the iothread unlock (or it may 
highlight an existing issue) even without rcu waiting.

