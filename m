Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE81F15F69A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 20:14:29 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2gQ0-0000by-HV
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 14:14:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j2gP9-00008y-WE
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 14:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j2gP9-0004hr-0Q
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 14:13:35 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j2gP8-0004g2-PK
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 14:13:34 -0500
Received: by mail-lj1-x244.google.com with SMTP id r19so11903138ljg.3
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 11:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xe7l9a+UU84EZcyalv1Jkzz98U29uAV4gz6hIknjfsg=;
 b=v4eyh9JXkUIVb1s55tjYJyrU2q/MUpTpLbK1Qx33h5UVBMNoP4aokX8M2IHU19lmhZ
 WvQVBvHkH/O/3a0xlB0eKGES4psQUAfYXE33BCSnyW7ZmaRwWupPEstqapzzMpmbL4BJ
 hmO8eYttEfADc+5dVTpH8VGsW5m1pC7Qb/ygw2I/MwBGOEoeijrfj7Ksv0VfCye5817j
 lnsw6JVxW31H3DQIvG5bylO2xIgAIfn1IKshtwas4sZzLDN0Oxn0STgJ27KtRANkmdrk
 BcwSXNIJrcHIFi5rTfN0CgamMS7L9V3qWaX14oa5GJQb0W4RKp1H8MBTMyafNGxaYwQJ
 fCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xe7l9a+UU84EZcyalv1Jkzz98U29uAV4gz6hIknjfsg=;
 b=VdYDdxED4XTrmlFAoUcoUfxFhVhgutmQZNIJWh+MQNPdP9juXnbQfYUqOer4oN85Mp
 rg180ZjUC4hPFIGhwDtB/SEf7aWbqhep1yvCbU4EYPdwH9Q4rkkdVstAWU4btakd8aCQ
 0KQtS/YJ5/TBK0N7XbRGFVd9WJc7PPtQYg8bUqec4VHE/10YSWVGVv9VOry6hskGcMjT
 kDXsBVgfs7bF+ON9gmqirzqqP5V+TfIEnKi/zhFGgGvLiRUqMZgce6ZMHr8iHRKcUMeo
 Rm2Tj2YgbukWkhj7ZrkL8zJQLTy4gJ3kIzILTqitDkSpiyFFTxF2BSlaXIGH+FLkMsK8
 I1mg==
X-Gm-Message-State: APjAAAW7EWs3NgsvXt7RxNSDJ3kNNiV49MdjytXfNFty9T8IXl5Nk+W+
 N67Npqp5G61+cNPBfUbVvQXPl2xC0NljZxSLdrP11w==
X-Google-Smtp-Source: APXvYqwb4dKnTvXtGoOt1kVP5GxbUkwbubU30HQPys92+k0iq48qoJFe/L7yvDjUrG2qc/QZvwMEFvkSqJmDhJ3DMUU=
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr3026406ljg.166.1581707612908; 
 Fri, 14 Feb 2020 11:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20200213225109.13120-1-alex.bennee@linaro.org>
 <20200213225109.13120-20-alex.bennee@linaro.org>
In-Reply-To: <20200213225109.13120-20-alex.bennee@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Fri, 14 Feb 2020 14:12:57 -0500
Message-ID: <CAEyhzFtNowJc-f20QscmSzK+_1qVx59e2RYvuomY+oJOBFOasg@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] tests/tcg: take into account expected clashes
 pauth-4
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, pbonzini@redhat.com, stefanb@linux.vnet.ibm.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 robhenry@microsoft.com, f4bug@amsat.org, marcandre.lureau@redhat.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 kuhn.chenqun@huawei.com, Peter Puhov <peter.puhov@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Feb 2020 at 18:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Pointer authentication isn't perfect so measure the percentage of
> failed checks. As we want to vary the pointer that is authenticated we
> recurse down the stack.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Robert Foley <robert.foley@linaro.org>

