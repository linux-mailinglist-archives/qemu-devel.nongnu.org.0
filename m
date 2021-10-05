Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2DB421FAC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:49:14 +0200 (CEST)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfCK-00081E-Ku
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mXf9i-0007Ir-FH
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:46:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remy.noel@shadow.tech>)
 id 1mXf9g-0008W6-3u
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:46:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m22so30246086wrb.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shadow-tech.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=proPMOogsiHlGikXY91al66XUVjTfTzJxK0jukZl3PM=;
 b=wr9QYryr89BYblVu+SFfNSMZ5vWShR2IfpDRlS2q/5lVh6+ol/i7td+esIqz+uSToE
 agDz/+lPcB6GdkXw3/5CIjAle6SdmkncHlEObhXCSub3Qju4rlxEp8zZePjOqZLnRU1C
 koJBHGnYfS5D3cqW3LZ08B1I5haVQ0OG9H2SmcajbLZNKmJ4OTxyK3aUCtyGa9DUW6EQ
 9HC0eXGeqWv3wKmZAXW1CQ1Lezg4j4UD1x8w8C3NqubVczOI5R/71RVnDhwEvohbAE0/
 L1V8EwntkprtwHbi4o7q2Kj6O2ZAMRmpp/gg1RzRJPI3FltSnLeq9eHhIxnjFeMnn0UY
 66oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=proPMOogsiHlGikXY91al66XUVjTfTzJxK0jukZl3PM=;
 b=E3ltmOgVUo5vpGRrR3z+1zZOEqoJvO+dT0iGPaACKDpZQTo4vm46mOchgp43xfp3Z8
 elePbWdKgimJANmRhatyHepnk/Od4/u7ZXDUS4g3ToDqg29Tk6RKN5CzXyAWc8kpL9MI
 KMEROb0S0bcxi1q1+x+gfBkM2xnf0P5xk5LFvSpAF+3dOQBgErNgBPLhhmYdVao5nPO4
 5WM5VQTAqmILY34t5LSYl26KP2XbAG1JpUf9yMhqqcAoOm9jaYkY02cGdtW72CO3iG8V
 lU/okIAdOQ37VIP4rWGOj8psbuLNouG77clozSgAQrTmheWCxXHEuW7+pZXxPqG51k82
 htHw==
X-Gm-Message-State: AOAM532UYp3TtPqQqa/ey//esKpHlnKTN0frSM0mEiQTuZFiBWr83OPt
 MrkZzpLbdOJqNzQS4umAZ0mDeA==
X-Google-Smtp-Source: ABdhPJy9iD+58R6y3e1Q32iL31ZybMBZ+N23/IqiD6BwKuN80M3n3OSB1eZgS1RFtXtJFQFWYA5b3w==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr19550027wrs.58.1633419985191; 
 Tue, 05 Oct 2021 00:46:25 -0700 (PDT)
Received: from gmail.com ([2001:41d0:fc88:4700:250:b6ff:fe1f:8e7])
 by smtp.gmail.com with ESMTPSA id c9sm992725wmb.41.2021.10.05.00.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 00:46:24 -0700 (PDT)
Date: Tue, 5 Oct 2021 09:46:23 +0200
From: Remy Noel <remy.noel@shadow.tech>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Strange qemu6 regression cauing disabled usb controller.
Message-ID: <20211005074623.jt2wm7m5sp6kfwq2@gmail.com>
References: <20210930134844.f4kh72vpeknr2vmk@gmail.com>
 <YVXSUExueN0MpEDG@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVXSUExueN0MpEDG@redhat.com>
Received-SPF: permerror client-ip=2a00:1450:4864:20::42a;
 envelope-from=remy.noel@shadow.tech; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FSL_HELO_FAKE=2.955, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
>Co-incidentally we've just had another bug report filed today that
>suggests 7bed89958bfbf40df9ca681cefbdca63abdde39d as a buggy commit
>causing deadlock in QEMU
>
>  https://gitlab.com/qemu-project/qemu/-/issues/650

Is opening a gitlab ticket the prefered way to report issues now ? Should i 
do that ?

Thanks.

Remy.

