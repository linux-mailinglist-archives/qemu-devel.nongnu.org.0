Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB93FC53A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 11:58:02 +0200 (CEST)
Received: from localhost ([::1]:59386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL0Wn-0000UT-5Q
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 05:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL0Vy-000865-Rt
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 05:57:10 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL0Vx-00086f-8N
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 05:57:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id ia27so37346312ejc.10
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZWBK2bwkFuszTuGy0r8myEWw0s1DtIRTXLNCz72lKEA=;
 b=odOOzYrjeTWFQZlRK03g6tXSM150YCLu67kHfc1uYLLy5CLxv5GAADgx7wH6QBhh1I
 T/dzRfCupx7+DFtO+Ag/e1yK+s7W5RDpLyjR1eRV7RU1/jApeZXMuzmVB4b6VVuI68Qx
 sfhU5M4cinee291nl715EJrSjYcXkTs/NL5KbQd9yUo2U82lcHjiYq81BLo9iSx+EoOY
 Zw+aZALUco/8SMv1uMf9k+HufH+e2zMWoRhFwd8kIR6nPbaagfkFSQVBIFC4NqpjHrjn
 xZ6gDqADiL/CASI3S1a4pHtbu9cIHqAzDUDMw3h8BOj09e6cChk2wA9FZK9ok/CKiq1U
 z6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZWBK2bwkFuszTuGy0r8myEWw0s1DtIRTXLNCz72lKEA=;
 b=AlAn5qOGKl7BoIbLvAQZ3GLUZsP0ne1U/0rOhM6mb+yGW+v8/owL5Q70hnXwWH0qR/
 640/xiP0P28Wj996Gt7UU3nxMToAl/bGLHZHmrLTL347SHptbrnGCC9kokTV+GVvtnKN
 SiDt7Ag7hEKjpETnvnAVsU5vhgjvuOBwhct/gH6DbZS2PPC9+61KoPIpVBXeOVEyvXmX
 46PkwNJBH5+zFwYSpNThETJGiKNmtl+3pf1f8dn1hJr9pZwH7di2l5VD6UkXHtscFa5C
 umPC2Fx05TZw/tDjjWYs1PtudfSZs9+VteSyFMNho+yEFCODGnbBOUv5+OWVOOubwIuY
 DuiA==
X-Gm-Message-State: AOAM532pIZpI9q60rlTLH0qkVEwLhiInJsbvuW6F6GRbJOktI5k6T2Db
 0P1TrCZfo+v4ER7l+rPrINWZkQSyCIuVtPJecUuNkA==
X-Google-Smtp-Source: ABdhPJxEvLP9Y99dFj3qfyFiXV7L62OoawblXAZg8D3B99rjC5p8cYTWC66r3dqmKljo0u+nvURMwUCttGlz4yA3P+Y=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr29867150ejc.4.1630403827790; 
 Tue, 31 Aug 2021 02:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9YCwrm43JfFE_oenTYnj+vfOHD+Bw4mTHAqOnBgpQX-w@mail.gmail.com>
 <YS3r3CceplN2S6se@redhat.com>
In-Reply-To: <YS3r3CceplN2S6se@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 10:56:19 +0100
Message-ID: <CAFEAcA_5ysYrotyqEu5GqKy0AhuA3HMbuRnUYGxDmYdB_OPQeQ@mail.gmail.com>
Subject: Re: block/curl: should we be checking curl_easy_setopt() for errors?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 09:44, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Aug 30, 2021 at 04:34:56PM +0100, Peter Maydell wrote:
> > Coverity complains (CID 1460331, 1459482, 1459336, 1458895)
> > that we call curl_easy_setopt(), which can return an error value,
> > but we never check the return value.
> >
> > Is it correct? Looking at the libcurl documentation, the function
> > does return an error status, and there's nothing that says it's
> > ok to ignore (e.g. that it's guaranteed that the library will
> > safely accumulate any errors and return them when you make the
> > subsequent curl_easy_perform() call). On the other hand, neither
> > the libcurl manpage example nor the handful of example programs
> > at https://curl.se/libcurl/c/example.html ever seem to check the
> > return value from curl_easy_setopt()...
>
> Options that accept a string can return CURLE_OUT_OF_MEMORY from
> curl_easy_setopt.Most other failures seem to be reporting caller
> errors such as forgotten arguments, or too long strings.
>
> Does look like we ought to check return status though for at
> least some of the options, and if you check it for some then
> coverity will also complain if you don't check it for all.

Coverity complains about them all regardless -- I think that the scan
servers have been updated with models for some of these common
software libraries, and it now "knows" that the function has
an error-return that must be checked.

-- PMM

