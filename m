Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11CE4D3528
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 18:13:14 +0100 (CET)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRzs9-0003gZ-5v
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 12:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRzZI-000280-JT
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:53:44 -0500
Received: from [2607:f8b0:4864:20::b30] (port=44964
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRzZD-0007nd-Md
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 11:53:44 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u61so5598400ybi.11
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 08:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hnXmu6xyvFFF45iBCk28o5RnNmYk+3t0jKEKASCErL8=;
 b=xiS/r0w5bOZuwi1HZp4JEo480lMPzUE1CWMMyFsbVJAs+ECSo3/9tqRma4hP8UQVYh
 +YnYTUWRNew/ttU+Plsal7uYQ4vqzkyAwdMU/BSADDjJkIMx7XCiA7DBnXNVO+v7UwFa
 4j5+3V4XgtcUcd242npXNKWCmMMGqYnu4WEi1umnBRnGum5ln/0iRy3EDYMO5dhdhaGt
 ZGWRPXYGeKL7QMTsomxKkDg4YMN0aZ/oDOKheY6aJ9cc3H/ecZzD9y72qa1se7K2vVUq
 KbWeJyMAWTwEr4ixi3ALI6BKHAq+1IglZfunSMazBn4/YVM34/fHhC4SzobgfDTVvmGS
 VjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hnXmu6xyvFFF45iBCk28o5RnNmYk+3t0jKEKASCErL8=;
 b=fq5ss3n1VHpd4G8MMOQ8MimVBn3jaIjRf0BPOr9a/U17uRCzEhg1DCpAVsMAmVt88Y
 gXA7NcbwCRNabUm9eLskC7qukCu9RBI0bt/r37FHlrXyMp2YEPjjnwa4Vo3WYnN4dXDu
 qGCAAGfHocxnJM4EOM17UzcsKaZTBrul1hOjkeye7oN14repNeiOGSKRF8ypMdB1AcNQ
 0h4JA5+AW+qc1X4XxhaInb8P9o0jZ/OEHWiboU8QVq03+qJ8nmPQ9N7yc+j4OufUyJAe
 lO1yaRenHyMiarFL9UVj1ioHRqeBaqwcMeufaYwkfn5NfX7secTVIWDLyoc4C+naQXKm
 O5aw==
X-Gm-Message-State: AOAM531n2Y0jkkyvxHqwHzXznjxD0Mz4AvBRwK29L5vBrZV/epjATb7c
 s34SFG9Z0lxKd+/aQvCgzBK/oPyBBknjQfFUidXCCQ==
X-Google-Smtp-Source: ABdhPJwiwv/Co4D5/HVvqYMo+xYL17G1fhAhSHmYi84+aRRflMY6WtN5mJ//C4ico5ioqpGGgVqFD4JJTfSABSQOpcg=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr530024ybg.85.1646844818652; Wed, 09
 Mar 2022 08:53:38 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
In-Reply-To: <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Mar 2022 16:53:27 +0000
Message-ID: <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 16:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/9/22 11:33, Peter Maydell wrote:
> > Hi; does anybody know how device reference counting is supposed
> > to work when the device creates a "container" MemoryRegion which
> > it then puts some of its own subregions in to?
> >
> > As far as I can see when you do memory_region_add_subregion it
> > increases the refcount on the owner of the subregion. So if a
> > device creates a container MR in its own init or realize method
> > and adds sub-MRs that it owns to that container, this increases
> > the refcount on the device permanently, and so the device won't
> > ever be deinited.
>
> The unparent method is supposed to break reference cycles.
>
> In the case of QOM, unparent calls unrealize, so unrealize should remove
> the subregions it created.

It seems asymmetric for unrealize to undo something that was
done in instance_init, though. I would expect unrealize to
undo the effects of realize, and instance_finalize to undo
the effects of instance_init.

-- PMM

