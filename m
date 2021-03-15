Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116233C87F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 22:34:24 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLur1-0004Po-47
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 17:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLupe-0003qS-Bj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:32:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1lLupc-0008SF-Kl
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:32:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id n17so12399191plc.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=A1xSeUVacocDfS/Km1O4SsktrgSH2eJyasYfqCzk08I=;
 b=igbZWr6ohVjFWcQwszyj9E6oIMQ6hOgatH1lS84tSeiLRDl7PEG3yyVDAB0t68U5sD
 xtAf3YfE4hc+VIIpDxyTia9JdfS3CZDVZB7Zho4PXC/4mHo+8SGfELHpuReX7g6OFEkf
 ePCYXzekUFRv/O6XrdyHghTKZQcDZboVlct2NSH1wE4qBjFMhTHXjh5Plr+UX3Q/nTyn
 I+Xeg5o76AGP3kA+oi1HalzEExmaT/vZcEZIJ8EVoERCd2ey35IUmUQwngzzInAaipm1
 07bfMFv7dlV6Y343ZKgKbKRM1WhhFTHEhfULN1e3odNWgPICtlmnkR4UsnbPfixfrCqL
 ijFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=A1xSeUVacocDfS/Km1O4SsktrgSH2eJyasYfqCzk08I=;
 b=sxLmgL9dEoYi6yT6VxzLgHT+0YYaiVj/2XrFws//8X9VUs8Cr2AwQVVmGSmA5N1NUx
 l8KmIss3pEvALhx3QOhccb3OJJeUygg4kmvFIk4HuQsoDnL5zmrkeSA8CMsqEIocX7eW
 5e/H0cyx5Sipueopk0b0qM7wdv6VIdavOhbBw4BhaVjZaruNIAsyBxc02rVB7h3MuQGP
 buJz9HhxgXLn4zYaSgY/1Y26sOGXYgzV9u7yKi942kLEK39WNmBb3LiLJwzUXK1WjYu+
 C3DY7uP8ARdq+rAdzPer+/zRbsr+xBdLd7GjZYTmDkY9oZouJDYZ56gNbHYV6cSUYyC7
 Rtcg==
X-Gm-Message-State: AOAM531SCDBpITlJGAdr5NDxL7bce85CPvrj00WPijFjA8tj/Rfw7FSd
 kiWbvMfn7LJuR36tDlo2ziI=
X-Google-Smtp-Source: ABdhPJzy6bBekMU7H1CWRJtgaRGuyEj0IV43IYh8VETIB9XVb6UeUg0ursNI4qpAS7rl1387yRUtXA==
X-Received: by 2002:a17:90b:515:: with SMTP id
 r21mr1155760pjz.42.1615843974573; 
 Mon, 15 Mar 2021 14:32:54 -0700 (PDT)
Received: from localhost ([2601:647:4600:11e1:d2fd:ba5d:619c:c25d])
 by smtp.gmail.com with ESMTPSA id y24sm14257674pfn.213.2021.03.15.14.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 14:32:54 -0700 (PDT)
Date: Mon, 15 Mar 2021 14:32:52 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210315213252.GA1004959@private.email.ne.jp>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <YE+XFQ9MUcp9QHs6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YE+XFQ9MUcp9QHs6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Reinoud Zandijk <reinoud@netbsd.org>, Igor Mammedov <imammedo@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 05:19:17PM +0000,
"Daniel P. Berrangé" <berrange@redhat.com> wrote:

> On Mon, Mar 15, 2021 at 05:58:04PM +0100, Reinoud Zandijk wrote:
> > Hi,
> > 
> > with the introduction of the following patch from 17th of February, Win10
> > won't boot anymore without explicitly setting the machine to be 5.2 compatible
> > like pc-1440fx-5.2. The default 6.0 will cause it to panic and gives as reason
> > only "ACPI error".
> > 
> > It might work to counter a bug in Linux but this is not the place to do the
> > patch. The BSDs don't care and will boot fine with full ACPI regardless of the
> > machine chosen. Windows 10 however DOES care and gets confused.
> > 
> > I think its better to revert this and fix Linux ;) or make it a selectable
> > feature as a workaround that's by default OFF :)
> 
> I'm copying the people involved in creating/reviewing the commit you
> mention below.
> 
> I've also added this regression to the 6.0 issues list, since being
> able to boot current Windows guests with the default machine type
> should be considered a release blocker IMHO.
> 
>    https://wiki.qemu.org/Planning/6.0#Not_fixed_yet

It's about ACPI spec conformance. What qemu command line is used?
Smi is explicitly disabled (property smm=off), but guest requires legacy bios mode?
What about enabling smm mode? or "-global PIIX4_PM.smm-compat=on"
(or "-global ICH9-LPC.smm-compat=on" if you use q35)

Thanks,
Isaku Yamahata
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

