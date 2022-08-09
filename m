Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC258D921
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 15:09:15 +0200 (CEST)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLOyw-0007Uo-CM
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 09:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLOx9-0005a5-BM; Tue, 09 Aug 2022 09:07:23 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lmw.bobo@gmail.com>)
 id 1oLOx7-00052N-PR; Tue, 09 Aug 2022 09:07:23 -0400
Received: by mail-vk1-xa35.google.com with SMTP id j11so984841vkk.11;
 Tue, 09 Aug 2022 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=UOAoK7IQMDEeEt2nG0iFjgejZbUhappL+ozDYl4kVTM=;
 b=ndy6eHbL2RDYtNCD+/sq27rColzXawZxes8IjgNVhUO6x4qm8+PMTW3h8MaUEf43Nz
 ZNPg9DX92h/XoRc35dnWEazbQJC0yVesA0XyrbhMfE2DJkLNdEwQ0yLzNzA7x+sW5K6a
 RYK8p7qOjdd38JbF4Dpw4RSHR7haMzK0VVfcwNmQ6p7c4JFJbwTb22T5xgSlQM4wL8Xl
 8pNdv97Yy8yOhFqT66OlwL5Z7pRwMfIokW27sVjJQ3hYsUY8JSsG6GS1kt2lJ+O+hg+1
 CVDzciG7zpD9vZeXk5BTO8J92tSL31QH3YkBP1qQB+YxCbGTMqdk37AtpRp1VXBctP7V
 RcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=UOAoK7IQMDEeEt2nG0iFjgejZbUhappL+ozDYl4kVTM=;
 b=g4TTHEbrdZqytEWblfWN8wZeD9Ha6vrZ9AvkG96B+Cg0ZB6zU8dHIz6J8Pt/rLrnUG
 kT3trNU/7ra5Auh8Hi+Afg62n9VPc+Q/WxW89HBYe694lDG14xxOa4S+SsqzF2DU/AtU
 hA2bIGm7wyMsRi4XKMQQJ2sBCP4+H29n+fQ2f1LZOT5ZOHtpuaVbwdto6exaIoxHpUUh
 18OaYCF+1BK8jSQeiKmaj8cfSMlfIOP76CLF9GaS6kj5e3TCZ4ice23P4+5mq4BC5Ixf
 k2ycNiD6/RyDerlnZGiQ3Et7Yy+aIfdtDOBBCRZjZtJt5JcV0oS9a+OtNlYnLiMgMON9
 /jgQ==
X-Gm-Message-State: ACgBeo2go732iSfUwxaYa0xss8nem29y3xv3fhx8U6hu9AZk8rPP1WHn
 OVN+UVlBilZkPkJjhh4sZ58ef0CqEoXBwRY6IOk=
X-Google-Smtp-Source: AA6agR472E+2KFImJQlAL0x3/55KMlHGSRENEhSuZ3A3EcI8Ht8WOBCnHy/ZGb6mOCJeC9u46+lajC/6kJQ48pTeoLs=
X-Received: by 2002:a1f:da44:0:b0:377:2e13:1035 with SMTP id
 r65-20020a1fda44000000b003772e131035mr9667902vkg.29.1660050439860; Tue, 09
 Aug 2022 06:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
In-Reply-To: <20220808133727.00001171@huawei.com>
From: Bobo WL <lmw.bobo@gmail.com>
Date: Tue, 9 Aug 2022 21:07:06 +0800
Message-ID: <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
Subject: Re: [BUG] cxl can not create region
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-cxl@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=lmw.bobo@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Jonathan

Thanks for your reply!

On Mon, Aug 8, 2022 at 8:37 PM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Probably not related to your problem, but there is a disconnect in QEMU /
> kernel assumptionsaround the presence of an HDM decoder when a HB only
> has a single root port. Spec allows it to be provided or not as an implementation choice.
> Kernel assumes it isn't provide. Qemu assumes it is.
>
> The temporary solution is to throw in a second root port on the HB and not
> connect anything to it.  Longer term I may special case this so that the particular
> decoder defaults to pass through settings in QEMU if there is only one root port.
>

You are right! After adding an extra HB in qemu, I can create a x1
region successfully.
But have some errors in Nvdimm:

[   74.925838] Unknown online node for memory at 0x10000000000, assuming node 0
[   74.925846] Unknown target node for memory at 0x10000000000, assuming node 0
[   74.927470] nd_region region0: nmem0: is disabled, failing probe

And x4 region still failed with same errors, using latest cxl/preview
branch don't work.
I have picked "Two CXL emulation fixes" patches in qemu, still not working.

Bob

