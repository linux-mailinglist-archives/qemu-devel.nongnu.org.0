Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2893F7EB
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 14:03:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLRUJ-0006Yn-Om
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 08:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLROj-0002Kj-H3
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLRCS-0003Wk-1C
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:45:29 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLRCR-0003WA-Rq
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:45:27 -0400
Received: by mail-ot1-x344.google.com with SMTP id n15so5524225ota.1
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WEAw2osS3zhJSg5i3goIQt9zkKpmcwZWV4FWlmjGu3k=;
	b=jpVp7e9rpjW3n8P2C0W/X3blL6O8p3BY9hk9uBg3982RpG0TLNDWXMyMJO5DkOYVJA
	NQH/I20tz/+y3MLLpdYg5rVct4WoUsgS69aqdjfG99IL7gz554miE5uhJUimq5aG2Fd5
	HE7/OGpcxWfvTvBbY6m98c/jJOxGdyM9lKekWdMugPHpZruje9vB+QDCvDma5IvqJdW4
	b4YsOZaomwcnCPBCQxOOi6LBkusOSRUCAqjN8XZjOWQTLw2lSD6TmR2TnZ8OiJpN5OXX
	9k5F/86dU/xC6leI297p24f6IP0dd0GMcqgnRxTU+39Lg5ZiDjD+zNKql2VcGtNVCh12
	kTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WEAw2osS3zhJSg5i3goIQt9zkKpmcwZWV4FWlmjGu3k=;
	b=MMyFxGLhVZ9B09mGr9gcqJX2MwmmEjwjC058O2knD0e0uFpSVlmF8NGuRbT9uugX6/
	qxL6UUbkFXE31H78fsecLEsOZrcrWcyZMnsUldby+b9S/DMCUdnjB9PLuFMm107Soap6
	deg/HnU+EmkXjo/GePID+YagLHv6kKLN51QcjW2eH7efiZTXeupvC+6oGneWQZpZ5TWN
	1eXSvi26GO+Me08tCflXirFtb3KyZe2J9psGTd68xMcd3j4oMqAXisP+AfbYhpoymQi+
	bILbllpBx7k7KJwOp4gUmPB8VQqepcM05tNwnuu7w38EE9Jz8/bEKN1JQleYEn4Rn3wX
	dwqQ==
X-Gm-Message-State: APjAAAUEFlwyhbXHVqTrrCvg6XCD/cKS9ap4UerEaSMNNphh7vXF6bMO
	upKYjKpfMi+gVjJEPRo/7YrptDfdRxj0PhySIRccVA==
X-Google-Smtp-Source: APXvYqyqecI/zT83Q+kGgpcoZD2fZSVQOfsTKK6IG6jAvsWvMWWDJNnjbjGFGNHhG8s7L2+v009p1aSDNHB8ZzaA+1s=
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr7362069oti.151.1556624726941; 
	Tue, 30 Apr 2019 04:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-9-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 12:45:16 +0100
Message-ID: <CAFEAcA8BFamgiFG6O28trRYMnDNU+bEEuF09rX0TJHdgTAHqHA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 08/26] target/lm32: Convert to
 CPUClass::tlb_fill
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Walle <michael@walle.cc>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Apr 2019 at 04:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Michael Walle <michael@walle.cc>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

