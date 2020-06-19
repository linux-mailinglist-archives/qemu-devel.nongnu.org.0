Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67DF20072F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 12:46:56 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmEXv-0007SI-VK
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 06:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEWy-0006eg-8W
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:45:56 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:32946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmEWw-0002AZ-Mu
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 06:45:55 -0400
Received: by mail-ot1-x32c.google.com with SMTP id n6so6958322otl.0
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 03:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YtnJU7Q9GYuKOeW1X6yYehjLVPpPTxfkqalbc7n4tA4=;
 b=PUjvGluMKftZ+GOMnNeSf1yRD//hDjC63V87x3C/sD7AUCoBkVMZ9ixdOl2+uICiou
 XKcRW1gnoq/dXss9XI2ml+nrwO1wqekmu4Bw+R99oH+CrgiHy0ZKjm5rhdXkjOOgUJl5
 gKA7jEzBejqvS75UXWqci5+L7nLYQjq+vsXTCuKSWwTuMSsLa4eW24yKIJE/NCu6qrfC
 +V41iIYaJnA7FeU0f7d3GDwQwLHZtl9e+gJSnpq4e8SHWYRJl8+ePaYp4goDT+XItx9h
 PoxN/0T1XbRsmVcLu04ddOqDX8ein20yENbWUIXXtututPHKQlIil6N6H+eDQecGRKSv
 gMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YtnJU7Q9GYuKOeW1X6yYehjLVPpPTxfkqalbc7n4tA4=;
 b=NhHUe1nqEICSqK+lU90KV9Q13nAhovUlFZFD5k8NqclMcqbtR9F+gNfUwsV7Xmrd9j
 rV0MYVwjbEl94WAd+BFgPmthePkWL0sd3FkJwWnCcJmGuFI1Qp9GEm8x4Bn2jWfklIgJ
 BAco8VJBcM1KVCI4FRUHl44STefVLgmO3jl009oePJBx2JP2paidUmAFYhuCCzBDsEZM
 EEBrtF4KEJO0ZeX4jTAzReX0/IX11JONIZ4AJj5pOD88P48KTEdxY9WiJnvwIx5xBeYW
 4tzSqqo6wlyWwE5O0Ans0DgcJB47dIIuOvORD5J7lH2r/tdrBuG9VnsFr/SGaHBhrrju
 G6Uw==
X-Gm-Message-State: AOAM532DKPtiUvcj6kNbWHpsHOYbGWekZxP496x1jrJFcSD3WYd7H3As
 +odHDLHMsQQjrp2QIBTjRNyxD12M5PrQmyO63Q192w==
X-Google-Smtp-Source: ABdhPJxoJRvdtHpM3dx66qO3/Wc2PQf/IzGWvOfFRpLzLsAShkVVydyOx48D96BiAaT2s+DgT0gOxk7gK7uVWi3RlF8=
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr2431830oto.91.1592563553320; 
 Fri, 19 Jun 2020 03:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <159248913721.23362.5273483564160951801@d1fd068a5071>
 <610e9438-1524-5708-7181-7e9801f14ec8@redhat.com>
In-Reply-To: <610e9438-1524-5708-7181-7e9801f14ec8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 11:45:42 +0100
Message-ID: <CAFEAcA9Z4pPNCgcVNFERqtDp39=5We6WQr5mbwqxHgB=wQeN2w@mail.gmail.com>
Subject: Re: [PULL V2 00/33] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Jun 2020 at 04:19, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/6/18 =E4=B8=8B=E5=8D=8810:05, no-reply@patchew.org wrote:
> > /tmp/qemu-test/src/tests/qht-bench.c:287:29: error: implicit conversion=
 from 'unsigned long' to 'double' changes value from 18446744073709551615 t=
o 18446744073709551616 [-Werror,-Wimplicit-int-float-conversion]
> >          *threshold =3D rate * UINT64_MAX;
> >                            ~ ^~~~~~~~~~
> > /usr/include/stdint.h:130:23: note: expanded from macro 'UINT64_MAX'
> > ---
> > 18446744073709551615UL
> > ^~~~~~~~~~~~~~~~~~~~~~
>
>
> Cc Emilio.
>
> This looks an issue not related to this pull request.

Yes; it's caused by an upgrade of the compiler version on the
system/container that runs this asan test build for patchew.

This proposed patch would silence the complaint:
https://patchew.org/QEMU/20200617201309.1640952-1-richard.henderson@linaro.=
org/20200617201309.1640952-7-richard.henderson@linaro.org/

but it is waiting for review and/or discussion of what
the right actual fix to the code would be.

thanks
-- PMM

