Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE582DB22E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:07:22 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpDnE-0005Ye-Lx
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpDeg-0007Hu-LJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:58:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpDee-00007y-Cz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:58:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id n26so28697879eju.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 08:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MA8ZrIsYelqT2T864XtLB5T1+I0SBAyjmLKIfA9i1hE=;
 b=jxVsGCLD6xIH8hqn8/GyEn/KzrcFKBZnfntlkqFzD1nLEjnnz/dn2Y7mDAusEsVd3M
 HNxGYQR6zjhJ+W9fyWdwpiqIYWLI5gfZOVTAAfFXhkU+He8JYNOcU4hvcPYANq035OwS
 IQUULIxfuR6OVB1WXilkqfbmb/P2uQ2rt41CFjghsaAVptdWWS/Gjn1ULf2EllXvIPv5
 gy6HlKOt4t4SqGOMVBVwx4jeLlrQWFhgsbKZk2ffHsjK0F0RfDxG2r0lqOFRVawHGt2X
 A90+rFQVWmyAlBiyxpR11ACXwUFw/Apftwy4panH0AKy9+9Rx9O69FCxTEB2fJlfmFQ8
 3fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MA8ZrIsYelqT2T864XtLB5T1+I0SBAyjmLKIfA9i1hE=;
 b=Ks0O1jZMNKyA+dq9KAoOl6334IwC7H9WjBD2NM38VVjxuTAYZsiB7T95TSkU/QKO3/
 PSGIOIwLM/zvpSZ/LZem6TWnZ9wp3wB33im4+grlJ9v8bSk9cZnelzkW0P86rVAsncBn
 mIOg1H2u9hGl1PMBYaKF/0jumrORUNiuYo6xy6W3zWLLhyohAm0CTeNVgJ0hzx+GC7vI
 NYPUGXKACzJ3Q9X2WJ/cbVBeMzJrV5dD7Q/NrHNkPZo1lowkSv8mnYr++vdJoo+3ynOa
 6IYEi7s831fSdnlpiZAdUfdllEA7atIgMxv/74ufixSMuBds4/DLnun1OrnyR7yiec7J
 nO+Q==
X-Gm-Message-State: AOAM530jYJdormC1LST+CV6EV7buidkL20ZwExTZm0iOMEQ3jqIPmNqz
 Wn5vAdHaVfjA1piouUZkKgm/sA460cVfvd5/loCPMb38ZUQ=
X-Google-Smtp-Source: ABdhPJx3fe8ZxLTnHG00ISc3BdKyXyt7WqmS6T0GzNqxbOLr/uvbXuUAB1GG0wBjgTc/uiZNssrayhabGw3jk11be7A=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr28259188eja.250.1608051506830; 
 Tue, 15 Dec 2020 08:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20201215151942.3125089-1-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 16:58:15 +0000
Message-ID: <CAFEAcA9hPjJ4uTK1px8zvB7c7MMejOAV0eb_4ohZagc7C4kCGQ@mail.gmail.com>
Subject: Re: [PULL 00/25] Machine queue, 2020-12-15
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 15:21, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 37f04b71a9cd62ca0f2d24a70fe843619ad45cd0:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20201214' into staging (2020-12-14 16:31:15 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to f953c100693dec2338d643ec21d131d411e9d38e:
>
>   MAINTAINERS: Update my git repository URLs (2020-12-15 10:02:07 -0500)
>
> ----------------------------------------------------------------
> Machine queue, 2020-12-15
>
> * qdev code cleanup
> * Convert some QOM instance properties to class properties.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

