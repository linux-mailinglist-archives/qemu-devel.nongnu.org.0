Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA651C19FB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 17:47:21 +0200 (CEST)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUXsl-0002SL-UJ
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUXqv-0000JH-SU
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:45:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUXqt-0005hH-I7
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:45:25 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUXqt-0005bt-1m
 for qemu-devel@nongnu.org; Fri, 01 May 2020 11:45:23 -0400
Received: by mail-wm1-x341.google.com with SMTP id z6so121736wml.2
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=0zEnr24f16kOnosqHhhXHZnopRZr6URo5A+Bz131Rzw=;
 b=kkk5ygQgn9Lyn2cvDJ7189EP5TQtTSZTcE1VYCH81g/ORbQxmXezn86hHDlys7Lc/a
 X6w0UTwb5HrJ763MvkoK20DVhcKCNze0Ml8AL/dEri2CScss8J8RP0ZqfbCcrAneCZo8
 WTvTeK+Hn2s6jA6jui03XU7g9eMtOZYnOeKQd80+4S/oIqtfVy5hvqGlPITXt4TEfCGY
 sqxSEIfbaD0HLyFVKjwOKkmM7jsjTcTAjUdePTsb2Z2vxu+g+uVvavmFPzQx7zMbJlub
 0ZB87L8sgGgx7nH2cBKvReq0a7ULCduQPA85c7nnB9hG7pEz83ibpPs8BqbUs+QMe64q
 RLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=0zEnr24f16kOnosqHhhXHZnopRZr6URo5A+Bz131Rzw=;
 b=mS4A0s+MA7y7pCTW8g9qOhXDTJcmjKXM+DrgzAen47scylrL8pUnzKb0XbyQIdkMbB
 zlC1kyz3ruuXI0svn70EItbgYbhAerTiUhfSRRPZQz4XiMpP1FIqtFiCe7cOcOBlQ8Kk
 LAJNSLdAi3yI1xIfKq0BYQgX2DvmMGWWXyDz8qD+WVRUZOD0zbcDCSkV6gG7oZr4xxFZ
 AJSFN84bvLOPX6EpkubsUpK+mDSABPkaJhxLQaHJiSnHSR4Gb5NCTPstkfvu3u1ZE23v
 EsioS5XNmNN3yiNhwPxP3FhI2bxaVGktiv+I6atAaJwy8f4+UFA/rSKMVJQPUiZPafvj
 jmGg==
X-Gm-Message-State: AGi0PuaMRbGzONE+L0cQXdFpR93FdNpu7ga6xjzUAtbHDoFU0oRl0JXb
 mZbSjuuDqE2ALRDw663WhPWcGA==
X-Google-Smtp-Source: APiQypJdZUdDP2VBi7WsAa+57czl9ISaiOj9FAc75mKmU6Qz9fkqg9NR9tNgnjDAYr1v1enx0F7QWQ==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr145285wmi.83.1588347921322;
 Fri, 01 May 2020 08:45:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm49149wmf.34.2020.05.01.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 08:45:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C91E1FF7E;
 Fri,  1 May 2020 16:45:19 +0100 (BST)
References: <alpine.DEB.2.21.2005010036120.30535@digraph.polyomino.org.uk>
User-agent: mu4e 1.4.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [PATCH 1/4] softfloat: silence sNaN for conversions to/from
 floatx80
In-reply-to: <alpine.DEB.2.21.2005010036120.30535@digraph.polyomino.org.uk>
Date: Fri, 01 May 2020 16:45:19 +0100
Message-ID: <87mu6rirqo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Joseph Myers <joseph@codesourcery.com> writes:

> Conversions between IEEE floating-point formats should convert
> signaling NaNs to quiet NaNs.  Most of those in QEMU's softfloat code
> do so, but those for floatx80 fail to.  Fix those conversions to
> silence signaling NaNs as well.
>
> Signed-off-by: Joseph Myers <joseph@codesourcery.com>

The threading from this seems to be a bit broken as it doesn't link to
the cover text. Also its a good idea to use get_maintainer.pl in your
workflow to ensure maintainers get CC'd so patches don't get lost in the
torrent that is qemu-devel.

--=20
Alex Benn=C3=A9e

