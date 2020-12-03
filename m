Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC52CDBA1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:56:39 +0100 (CET)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkruI-0004ON-IY
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkrs0-0003MC-8o
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:54:16 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:39117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kkrry-0000wj-5H
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:54:16 -0500
Received: by mail-yb1-xb43.google.com with SMTP id g15so2641790ybq.6
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sc3zJY2XCC7qzbfH5kEOpZBt6CKRXKC3SpULJ362er4=;
 b=c1Bfohhh3QQaOdN8hl606iz5E8HFEElpZl4ZMs7vf1Vr+DgLlLqMUYr00ZNV3mv1mp
 1uudy3oGJRzX7GwBWArh9grtthKY+8T+j21SUTbIW1cwl6Qc5YOOokGMwuToAIo5GG13
 jlNXiGgvdThIGlYRCmGFLt5t/01W2J7jJvQRyha8E5sSpQzLw35JJGgOdP/J5zdetyXS
 vZcQVTlosa4wjCS8c6S8QnVRp9XMdaFq/8/9GsjHCF9ES4+Bcm89+/BsSLykh3iZnyKG
 L0AIPDveb+3ei+SIqmMsz0rRa61iKfmKol0gIk7+U2bkKKz/OmRQrc7+1R+DciVlq5MM
 D0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sc3zJY2XCC7qzbfH5kEOpZBt6CKRXKC3SpULJ362er4=;
 b=H64/O9g2xeWDVPx6UsnP2e43ptZDN2t8h9sE1PGfiS+i9lIn4A2rjo/hjBhFNdFys7
 53aplCdKz6knx4Y9qnvaSjEqa0KmkVIsctg5FTIi1K54NytMY6tFdqUXoQ8W5zJphBuj
 oKUKSuUZgLYga0Y2trLkYJTnbShKomeET1kJHX5MS6skHbCU3rOZtZHHXRj2IA4akmud
 d8PVhStZ7nYgKF+MeugclsxuEZG5ty01k3LJI8BtMuOSv4Bcu9euAfwXf1IYMF72Ir3p
 mZQffHG67IP0OQ3dJoiMt70PR7J3RJxRY8fK/deB7+QOhr1KzIOzb2pBtbZg0sojx3UM
 GA+w==
X-Gm-Message-State: AOAM532BxXPjQFW0e4gUP1zTKdby8d6COfCkMimU4umn4rKBm6FoqsQg
 aDY6os/xmAJy+b87LzV2U/eVTDl2zkLHPTqKlLE=
X-Google-Smtp-Source: ABdhPJwtn8HkCnO6ER7/vRpbgqtlpQRucEUWrn7lY6MPzUJ7En6tJ0VrUODOe1KwB2OIgKdvjfEjonDiRBmcLAJ5t/4=
X-Received: by 2002:a25:d713:: with SMTP id o19mr5935849ybg.378.1607014452380; 
 Thu, 03 Dec 2020 08:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
In-Reply-To: <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
From: Cupertino Miranda <cupertinomiranda@gmail.com>
Date: Thu, 3 Dec 2020 16:54:01 +0000
Message-ID: <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-yb1-xb43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

Thanks for your quick reply, and again, thanks for the reviews.
We have already started to make very significant changes to the port
based on your comments. ;-)

Our generation tool has different levels of verbosity, expressing
instruction semantics from a pattern level up to what it is shown in
<semfunc.c> as comments, which is later converted to TCG format.
For QEMU purposes I would say that input format should be what is
shown as comments in <semfunc.c> file.

I believe that I can in relative short time isolate the TCG generator
and prepare a tool to process those comments and update the respective
TCG definitions.
Also, as is, the generator is done in Ruby, and to be honest, would
not be very easy to redo in some other language. Would this be
considered a problem if we would include it as Ruby code ?
IMO execution of these scripts should not be a step of build process
but rather a development one, such that Ruby does not become a
requirement to build QEmu.

Thanks,
Cupertino


On Thu, Dec 3, 2020 at 4:08 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/2/20 6:55 AM, Cupertino Miranda wrote:
> > I totally understand your concerns with generated code.
> >
> > To explain our decision, we have an internal database that we are able
> > to describe the architecture and map encoding with hw semantics, and
> > for the sake of saving us debug time generating each and every
> > instruction, we use it to generate both the TCG and instruction
> > decoding tables that you have already reviewed.
> > This tool is not only used in QEmu but through all our tools code,
> > allowing us to cross validate the content of the database.
> >
> > Considering our situation and current state of the port, what would
> > you think is a reasonable compromise?
>
> In some respects you're in the same situation as the hexagon target that's
> currently in flight on the list -- both of you are wanting to generate tcg from
> a company-specific canonical source.
>
> In the case of hexagon, the target/hexagon/imported/ subdirectory contains a
> bunch of stuff exported from Qualcomm's specification.  It's not fantastically
> readable, but it's not bad.  These files are then massaged in various ways to
> produce either (1) out-of-line helpers or (2) inline tcg stuff.
>
> Without knowing what form the Synopsys database takes, how easy would it be to
> export something mostly human-readable, which could then be processed by a tool
> that is included in the qemu source?
>
> Future qemu maintainence is thus on the tool, and not on the auto-generated
> code.  There's also clear separation on what needs tcg review and what's simply
> a spec update.
>
>
> r~

