Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7E1AE406
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 19:47:22 +0200 (CEST)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPV5F-0001nk-4R
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 13:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPV3d-0000fm-8t
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPV3a-0007q3-KK
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:40 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPV3Z-0007kC-9E
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 13:45:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id e20so2134721otl.2
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5RytxVrfUiR+oBHUbS2vsYUgPfTlYWpl2yZN+midB3Y=;
 b=fIVDy2S8GH93ksuN9ddoIe780fuEIzc7m5ijfzie5/tX9g9DU/esn/IYMeQI43XJzh
 adNg65kgVGHp4BWmFOLuck7wocMngxGUGiyIWPXGn8jqkAbRu7gJoGWFXWbccZY9AT4O
 1dod/0Da+1UtUCa+skFGefmEzoVl41BmhaSqcT2M+dnV+qR0iCiuF9GbDxYvED75qDjx
 fBtBnS5DKMhM8XmQdWBQ3X9nLnbGx+Lehu20dOBcm0d2m0tKED6fsa4Veh/L3r/Y+5LK
 Zpq7GrQV5rQoCBrlOch8+V4WuhSg8FykugOh/DGSMq3d4bn4LCXXeoM3yRpBUxqAi/zr
 vb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5RytxVrfUiR+oBHUbS2vsYUgPfTlYWpl2yZN+midB3Y=;
 b=F+W5ZB1oIgPJtt1PsjajbsiPU2HCHWda7/0NwmOAowYVpylBqLeatPH2sKkr+zA7Tl
 584ykMg2dzHlsgkAZSibe0DizuBqysLmiurK7CB2gsIYn7u3hAvZ1fTLCTqQ8Nt8LCSP
 NKkqkJxOG9JSBd2EsYMnd5Olw/SdDSjfL1bOcD5i6JNP8xHge1lmDQ2qLhyiTNRXjet2
 gOQjYHhPgUcMmidpeTGKfbyKLG/abCR9bEb8dLvum2KYtLfe8M+4qSGa68YYsKmTeia1
 gHMPSuju+7+qhpDJr/9PLMCPMgeFbzym47kwQmmw2RHJlgnW4xf0IbRXnkkrGSrxf5xY
 SkqA==
X-Gm-Message-State: AGi0PuYLd7VRErUnE7Biubw0lgpSJZp7iAV4X/XoR5BoMt4FEjFnVj8U
 +iz065RCOFVIe3cbGKoFPQRvUDpTC9mb/2JM25NHzg==
X-Google-Smtp-Source: APiQypJoB6dr/5F/+0tKj4m27pmEyNl39ObqCowGTpwtQQLLdwOObOF26ySknnw8JLRF2c9Fq+bFkeyLkyv3S2vT5V0=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr3420001otj.91.1587145533313; 
 Fri, 17 Apr 2020 10:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
In-Reply-To: <20200406135251.157596-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 18:45:21 +0100
Message-ID: <CAFEAcA_+tLQO0P1Wo2Nby1zyH458_yDWd-9Odw7Adjc4NvQmzg@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] Clock framework API
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 6 Apr 2020 at 14:53, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi all,
>
> The series has now been fully reviewed and is ready to be merged
> (obviously not for 5.0). I did this v9 to fix the small typos
> Alistair spotted in the doc. I've also rebased the series on master.

Applied to target-arm.next for 5.1 (with the two fixups I
posted earlier applied), thanks.

-- PMM

