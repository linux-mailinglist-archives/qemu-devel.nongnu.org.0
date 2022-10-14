Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E099B5FEC24
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:52:06 +0200 (CEST)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojHMK-0006zb-Bh
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojHH1-0003pW-0s
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:46:35 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojHGy-00019o-S1
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=49KMKnpAmK8uJW6umfDyIQ0nrovetEEtWhUCfg6Z4nE=; b=NrjclLvTSNa14ZvJBi7QjKvJ8I
 9Y0cTg3rp/LDMOR7Ue8ZREZPCN009p5godwJrrklTeRlpXomOm2bVyG/dzs0Vnp1xQsWC7iVVd5yy
 4DD/14570URMI/88uApKub0Nhp9S1lw1maPHX0lWRrrTI+l40W2jtj2HNufv4mVdEuhJD9Scz8+G6
 nSwHsSTtpzor9401FhK3+szaXnZdt0g7lhmRxkDVWrCyLGDUS+Jc/Jb9pLB6A9WOFHs036FG1jl6M
 aWIopwNI75zKdOb0qig7KQtzteJlz/a+nKKMwz0lRqqNr6TSWAmzvhHNZBCcCREPfntc3/a13/ync
 eAM+BaVBpmPXBpfbqhwtbaAHvg7dQOQtTB0xdHTxTkvO34y7QQBfYMnJpH3VaeApo56T2wGZXgXhc
 mqU0N58Y1pUwxsZYDOFxQm098eSUo9Ibk/m5zotygvif4DPKOedCQMWGOn0k8AdUPDlZTpeUhI2YZ
 rrRANtdSPogEHJdPcY4GVpMFK1mrfAqdxrFkg8YDtuuv7458R8mq6Br60gVyHcwzvwYzCG/02uPgM
 ntE5S6MuGLHln6Af7Aq6MsaQH+jCWKgn+PewqBuKzMxPtDyagJQ1vO5rlZWbEANAbGOBA7GP/EvLB
 2kJn6M1hFUipWQOzgNaM9RuCLAQVkk0NPClbwnvhM=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojHFC-0001p2-9e; Fri, 14 Oct 2022 10:44:42 +0100
Message-ID: <b3d01cdd-9893-ee76-0d3c-fd11ea6e3f7c@ilande.co.uk>
Date: Fri, 14 Oct 2022 10:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221012121152.1179051-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 0/4] docs/devel suggestions for discussion
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/10/2022 13:11, Alex Bennée wrote:

> Hi,
> 
> This is an attempt to improve our processes documentation by:
> 
>   - adding an explicit section on maintainers
>   - reducing the up-front verbiage in patch submission
>   - emphasising the importance to respectful reviews
> 
> I'm sure the language could be improved further so I humbly submit
> this RFC for discussion.
> 
> Alex Bennée (4):
>    docs/devel: add a maintainers section to development process
>    docs/devel: make language a little less code centric
>    docs/devel: simplify the minimal checklist
>    docs/devel: try and improve the language around patch review
> 
>   docs/devel/code-of-conduct.rst           |   2 +
>   docs/devel/index-process.rst             |   1 +
>   docs/devel/maintainers.rst               |  84 +++++++++++++++++++
>   docs/devel/submitting-a-patch.rst        | 101 +++++++++++++++--------
>   docs/devel/submitting-a-pull-request.rst |  12 +--
>   roms/qboot                               |   2 +-
>   6 files changed, 157 insertions(+), 45 deletions(-)
>   create mode 100644 docs/devel/maintainers.rst

Hi Alex,

I've replied with a couple of things I noticed, but in general I think this is a 
really nice improvement.

If you're looking at documenting some of the maintainer processes better, there are a 
few other things I have been thinking about that it may be worth discussing:


i) Requiring an R-B tag for all patches before merge

- Is this something we should insist on and document?

ii) Unresponsive maintainers

- Should we have a process for this? When Blue Swirl (the previous SPARC maintainer) 
disappeared abruptly, I think it took nearly 3 months to get my first patches merged 
since no-one knew if they were still active. If a maintainer has been unresponsive 
for e.g. 2 months should that then allow a process where other maintainers can merge 
patches on their behalf and/or start a process of maintainer transition?

iii) Differences(?) between maintainers

- There have been a few instances where I have been delayed in finding time for patch 
review, and in the meantime someone has stepped up to review the patch and given it 
an R-B tag which is great. However I have then reviewed the patch and noticed 
something amiss, and so it needs a bit more work before being merged. I think in 
these cases the review of the maintainer of the code in question should take priority 
over other maintainer reviews: do we need to explicitly document this? I can 
certainly see how this can be confusing to newcomers having an R-B tag as a 
pre-requisite for merge coming from one person, and then a NACK from someone else later.


ATB,

Mark.

