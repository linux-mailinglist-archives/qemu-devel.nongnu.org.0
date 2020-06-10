Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53671F4B78
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 04:33:19 +0200 (CEST)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiqYI-0001lP-C8
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 22:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jiqXX-0001MY-BJ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 22:32:31 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:42655)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1jiqXV-0000LH-VJ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 22:32:31 -0400
Received: by mail-qk1-x742.google.com with SMTP id l17so675318qki.9
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 19:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DlsP8MIR2b0GIOCkKR8pQs4MKYr5Wfpo8xVkyJ/JH7I=;
 b=w1pCcRUbFKLnlRvMNlyIa8n/QaL8XcUEGA6hTJY40NT+5EI0ysgh8lqFnan7T3U3L7
 SvlrtfBGNFuE0GKxhfMbVb4Dra1eAuajM2Qnpcb9yM9QjE933UIlMVTN+WIEpyRFkAu9
 OEgl+Y7RWWV1WTZB8ORZHA3EihXOCbo3L9Ky87+Cr4oIZdE/5mIPY3zKW6l2LikKVEmF
 tuw+hev1qPADCMNvxO0prKbsEEoazHzXBb9oP2IjvOO7h2cary5DvMwCxcp2zkRRZBIx
 bDYjMhcdxhzGolTyOhSdCg1YPYHNXJkdeyXEjAtjAYuLCurUowx21vbebuFUNf5mFfOi
 08cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DlsP8MIR2b0GIOCkKR8pQs4MKYr5Wfpo8xVkyJ/JH7I=;
 b=AqMhKy43O44SMxWd8oEuUoiLIuqtuWXrzIr4HnDSQ6uNzQhJ01G4ydGfq//8Fylcpp
 qkHESLseFWn+INVibxNsh2rA3uNcx/Oi5lrH8S5+mGJHcq86UukmEuqXdWs8ge6ngLrG
 0HFMJEGBpRvlGLGDLHS0YL2lF/7AwjA443C5kxF1ApXuIRwXwCod22hH50Yq2rPvE22K
 bCJnoIaMVknDUFVAVLhDzlLH3N+vTC6vq6XY9OgQoUNCEYpwVx2l0BYSrMlreH3IwtOi
 qH9V9FJNdlWwmgbNNUOzgdW8YcioaORyyflkCYfdA9BRuBzb/aNwqjSk+8cS4V2cYPBD
 2LtQ==
X-Gm-Message-State: AOAM533bnbCYZ0h0zZK4sjMFjzgaAC/hQE7QL56tiPR0ANN2685eGwul
 9HZQwIQJMQrRN9g1G5v1y/dk0A==
X-Google-Smtp-Source: ABdhPJwA+t70HGrX4P2yTbODQ0QKPhLJ4sjiRzbhbL/7AoHVc770f6gnbJXKkxl181IG53HjIZgMbw==
X-Received: by 2002:a37:650:: with SMTP id 77mr990397qkg.369.1591756348568;
 Tue, 09 Jun 2020 19:32:28 -0700 (PDT)
Received: from localhost ([70.19.54.161])
 by smtp.gmail.com with ESMTPSA id n13sm13457747qtb.20.2020.06.09.19.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 19:32:27 -0700 (PDT)
Date: Tue, 9 Jun 2020 22:32:27 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v1 7/9] plugins: add API to return a name for a IO device
Message-ID: <20200610023227.GA3816134@sff>
References: <20200602154624.4460-1-alex.bennee@linaro.org>
 <20200602154624.4460-8-alex.bennee@linaro.org>
 <20200608034504.GA3619843@sff> <87zh9e6kxy.fsf@linaro.org>
 <20200609040902.GA3724030@sff> <87y2ow4hrx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y2ow4hrx.fsf@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::742;
 envelope-from=cota@braap.org; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, qemu-devel@nongnu.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 09, 2020 at 12:09:54 +0100, Alex Bennée wrote:
> How about a g_intern_string() as a non-freeable const char that can also
> be treated as canonical?

I like it. Didn't know about g_intern_string (I see it's
implemented as an append-only hash table protected by a lock).

Cheers,

		Emilio

