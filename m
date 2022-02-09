Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE04AF3CE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:12:22 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnhk-0005t0-HA
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHn0F-0006IY-J5
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:27:26 -0500
Received: from [2a00:1450:4864:20::42d] (port=35623
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHn0A-0004si-PR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:27:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v12so4100962wrv.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RKCgZfRnLdrv11Tbl4rk38+5siU6+HXEX3AduOxsfpA=;
 b=PwampOwBEfIx0NZoz0V9Q8CLy7gBPf0D14N6CEEUD2IeaRrrlWFYU2HLzof59rZBDO
 MpvBzC9s37v+FLfLkEXG/vP89p3Oq2WZ/Do9fdimSkfI96uxColFUBSdEkapEEEZqJQ8
 D4zMGuMsYdzVSs5YrgezIftlF9LeYZOqx2nTRWb74ju3WjGyNusSAH1l2elLeKR4EMYP
 FrGQYepl8hm92gzMybXtZ3Q1Y6WsOdPqbIfgx9LcJyID3+tccy886q3XRSBW+dxYw7TQ
 2G8qLZz6rbvfU2/v2pHgZ3mJXtAvRb/CEnXl4jaArN1JXn+QhV3sggqkEQiqodk/LtXC
 0JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RKCgZfRnLdrv11Tbl4rk38+5siU6+HXEX3AduOxsfpA=;
 b=HztD8VmBka8SF/6wfmbBsHUjHhpAXCr3uSPTg2B2tNZZdwBwarzohxOqF8J15Os1kg
 ren3Jkel9Z4eELN2RI5iKkPpcqblS3ZCswfH1cDn6anMlnlJlE7Q0YH4z0B4nGO4YYcQ
 kYPHSykMsJ+/av8U2tBATs3Uf+j7kYPK2i5ld4E4WuiKxgClNWsxKxRZvogqXl+3nkEu
 +FRcg5+Ja0IGyJZMSWvDoTV329Nzm9VJ06qVI4Jg9EZLEaa8TZ7Tx+mvr3QVTwlAuImr
 F9fN0aK44mt0cOPxbjROkGI1JCDqc1fdSR1epJrEYh4c6A8n4xKy1Heo2//x72GHExUO
 QxRQ==
X-Gm-Message-State: AOAM5319gxVsAodAkL1l5pISnuO/CSWfnORxKVO2k4Cp0SgECcsfG2oD
 dM6+OlCjGOR1WhyY1psUZRWDd1qYJOxNPoH1ZTNQUQ==
X-Google-Smtp-Source: ABdhPJzlNhzoNWukI5oBi1S+6s6F1QyHE9X+XYdoGc9+0Fsu7NO5Kqg2K+z0okWDLK6c65JirRr/RrWoiZ5e8vXEn6A=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr1704267wrv.319.1644413235705; 
 Wed, 09 Feb 2022 05:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20220209112207.3368139-1-alex.bennee@linaro.org>
 <CAFEAcA8QSX9mfc_vAR6iXKYoPksb8Q3m9=nY97DpcKbT_nJYJA@mail.gmail.com>
 <871r0cfa1s.fsf@linaro.org>
In-Reply-To: <871r0cfa1s.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Feb 2022 13:27:04 +0000
Message-ID: <CAFEAcA_HbWTqJtTpfPLa2BdDcb7sFiyVpwL=p7K-28cFSB0_WA@mail.gmail.com>
Subject: Re: [RFC PATCH] linux-user: trap internal SIGABRT's
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 13:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 9 Feb 2022 at 11:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> linux-user wants to trap all signals in case they are related to the
> >> guest. This however results in less than helpful core dumps when the
> >> error is internal to QEMU. We can detect when an assert failure is in
> >> progress by examining __glib_assert_msg and fall through to
> >> cpu_abort() which will pretty print something before restoring the
> >> default SIGABRT behaviour and dumping core.
> >
> > There is definitely a problem here that it would be nice to
> > fix, but __glib_assert_msg is as far as I can tell not a
> > documented public-facing glib API,
>
> Yeah it's in an odd position - it is explicitly exported but not
> documented as an API but for use by crash tools:
>
>   https://gitlab.gnome.org/GNOME/glib/-/issues/712

Mmm. I think if glib specifically mark it as "not part of our API"
then we should not be touching it.

-- PMM

