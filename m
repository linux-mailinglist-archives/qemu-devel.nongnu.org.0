Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF15F47A0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 18:32:34 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofkqN-0006vZ-A6
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 12:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofjw2-0002Aj-EF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:34:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofjvz-0007FC-Hs
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 11:34:17 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so996980wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=qGwVVZARQtt1ggYvn8UACv1SxmqjKJMNFmd8pFmwv0Y=;
 b=E84Gb5xUIvXq337xaov7nQK/9OOyNVIcoGJ5Fq1FsiYJgtaYyulQlS20+uySVArtRF
 RY8nfDwntP0fcV2xv/De52w9zGa0UMdqIggrXEJeN003wsso+Umgff5fGHlos/i9Zn2P
 LFTYdMjtyedivTSgf5FLo+RUcYw3k0S/5/ncQW7QHbd1kFULHtSVSwxH8kOY+u0VWlKx
 Nsgc2GPsd4WuCvsozM2RwwivQ2H0vbO8t3/Z5e6xY2hmecjhe7PSRhqAT5CoLW+iYNv8
 ZOLdOtGUHhUQL1rvyxxH3PbKu6F5mQbpCZsIz1MCaVAVb++4boapLUluwXtNmTje7/ea
 J00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=qGwVVZARQtt1ggYvn8UACv1SxmqjKJMNFmd8pFmwv0Y=;
 b=Cz9lpFp5xIH/jy4T3njFI0a0YTZAhlVMIeGnR1lo8ErmqUsI+w8g8g89YB1r7CIHWZ
 8/1jAMBLuHqmUIbQpXo4pKiCUe+mTpBTL9ym30ZUpiVpFqoZFnH8hW2UKLC4rYBPKrDs
 dFuMGA9n2W8BMRQ0fGWw+7HpJ+jcFTP5/+dXkdpsnv9EqK6Z39vm4FQSCOvAG5jnXaqt
 pEDCARbVwt/EBl2XEQBbZ4W8+8oDNk6HfZA2x8uqHiHQePVjdstrvh3ln2aRsvjo7QFX
 sP1oVMz9dVB+027THa4knYnEdAFMGIMegT6DkE9vDqjHyreNB8lL1cVcAD0u5D8E1y1/
 uHyg==
X-Gm-Message-State: ACrzQf3Lcyi6U5y0qydr3TlxKtZlzDtkBu3/DbYWaYNHHcSw69z1An9S
 Sy4Hfo6aA9g67KziQozYhYUfVA==
X-Google-Smtp-Source: AMsMyM4cG48p5rlY0PUvu6+KP3HRpoUkOKWR3eiRSofDeqOfGS0jBdvEt+N04q7jmqjtI851yaQGdw==
X-Received: by 2002:a05:600c:2241:b0:3b4:88aa:dcba with SMTP id
 a1-20020a05600c224100b003b488aadcbamr221926wmm.203.1664897653403; 
 Tue, 04 Oct 2022 08:34:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m38-20020a05600c3b2600b003b4ff30e566sm4682237wms.3.2022.10.04.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 08:34:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39AC81FFB7;
 Tue,  4 Oct 2022 16:34:12 +0100 (BST)
References: <20221004141051.110653-1-richard.henderson@linaro.org>
 <20221004141051.110653-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v7 13/18] accel/tcg: Do not align tb->page_addr[0]
Date: Tue, 04 Oct 2022 16:34:07 +0100
In-reply-to: <20221004141051.110653-14-richard.henderson@linaro.org>
Message-ID: <875ygzli17.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Let tb->page_addr[0] contain the address of the first byte of the
> translated block, rather than the address of the page containing the
> start of the translated block.  We need to recover this value anyway
> at various points, and it is easier to discard a page offset when it
> is not needed, which happens naturally via the existing find_page shift.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

