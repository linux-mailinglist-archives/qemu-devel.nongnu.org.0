Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F14C334B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 13:48:42 +0200 (CEST)
Received: from localhost ([::1]:40684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFGe1-0003mP-5X
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 07:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iFGc7-0002lr-EM
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 07:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iFGc5-000798-Vr
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 07:46:42 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40451)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iFGc5-00076E-ML
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 07:46:41 -0400
Received: by mail-oi1-x241.google.com with SMTP id k9so14085218oib.7
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2019 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Owy9h9CbeBqsur4PDF1Glm0ZtZk1qNuNMArBODBFExE=;
 b=T17y7LwR+jGVwNIecWXR5/maDkiaA1uLjDArA7RNakmTokQP7t8SpTjQs2nCcvJm+W
 Er2aP3v8Az8vGxyDtrPoEwcgnz3TbTr0Qe9m7Uqw/r5Dnsnrym4Tj1P1t07AbV/jmbwx
 AoszYNWPnaReCNPePZw/7SaAJAtc7jBkNvD1pcXsu8+hULD6QTRX8mOkOTztOAbolYxp
 tTptp6mTZ9bYMqqScXuG54f1HUr3sijlJ4Km/fVF+pY7uCTIYfo+vjKhH34x0kmGanRl
 2EYH33CFEFbmGeB+zT80aFy2iawiiG2kijnK+h8RX7p4iUkXqlkvzDZpHpb+kC39sMeR
 kP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Owy9h9CbeBqsur4PDF1Glm0ZtZk1qNuNMArBODBFExE=;
 b=amwo1eXgRTCD4XSI9OoRAKPa0PgLpXil0vWYNvPwrZ0fyK9Un0xmmm/w9ltgCtMoJ2
 QFpotEX15CPA4mE0Dl9+uBUdsfsunzF4ylJw9OhnIlpFj+zHH7JO60XRBHjI+E3uV0eq
 2O2r1EcWRJM8CCL1GJQoNmusU5gQaq01GsSQs/LjCh9dW1msGlEI5PkuLMwx78ZvUQST
 npT78URfUPLpPkr7+x5ockHrLvpUkOqBgH+nLppN9nM79V/5JxXGCq+ZEyQOFiNn27q3
 YkPjxasz65d181NAlknblXPeuGy9eeVmYbe4+37Qpaqh9Z6+kqZq5XQ/32mhNrs0iSB+
 fCig==
X-Gm-Message-State: APjAAAX8U0mrBWsMKSKATOy3foGJD9vzZzqrdThhKAe8PejVm0wuP7dl
 7yAFNgiVJn9sA0XUS+Vyqrwl9TT6a2wPyp/7oLxNwg==
X-Google-Smtp-Source: APXvYqz3FlGOjH2BUUFKiVk3YivvH/+joSWj14ziywu8USnfVQ/J48HzR0DKAkbyaHdg1BH8jp2a/9tDcuhI9vQRVBo=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr3420090oif.98.1569930397150; 
 Tue, 01 Oct 2019 04:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190930192931.20509-1-richard.henderson@linaro.org>
 <ec1ace6c-49db-e769-e43e-6b0e059d6705@linaro.org>
 <CAFEAcA9r+N5Q076kWYyu0a+_VvnzU0FRXZK7hZ4t52JO=a3qTA@mail.gmail.com>
 <7315e0ed-0d33-e998-1dc4-01664c300723@vivier.eu>
In-Reply-To: <7315e0ed-0d33-e998-1dc4-01664c300723@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2019 12:46:26 +0100
Message-ID: <CAFEAcA9xT7rRCaP5hwvhzLH0GgMqp+Uk55vq=4TT7d-65Yogkg@mail.gmail.com>
Subject: Re: [PATCH] user-exec: Do not filter the signal on si_code
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Oct 2019 at 12:19, Laurent Vivier <laurent@vivier.eu> wrote:
> Is it possible to update the farm to Centos 8?
>
> Or as the kernel involved is specifically for POWER9, is it possible to
> use only POWER8?

My experience is that the gcc cfarm admins aren't in
principle against the idea of upgrading farm machines,
but in practice they tend to have a shortage of effort.
If there's a centos-7-kernel-update package that could
be installed without doing a full distro upgrade that
would probably be pretty easy to ask them to arrange.

thanks
-- PMM

