Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9A67F7E9
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 14:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLkws-0007Ox-DO; Sat, 28 Jan 2023 08:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pLkwp-0007Oe-NZ
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 08:08:47 -0500
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pLkwn-00073L-4h
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 08:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gTdIOkWr8KlBXAZJVmcsjkcBjiLQ8zBsuPrtsWvV0/A=; b=PMQJiA+NVzO6786xT8bfoJvq97
 9NTkaJ+v8Pu3kxF/QF+2XbcK0tIUMb26ArlgqRz0Fv5mdDwRHzGm+vjggrErE1HTNBp+n2fJsUvgV
 4PGE7Fg7rYBXtD/ZJKjK82nbFZHhszkkU+9dKcKWFmF1uUMUM/GLQ0R/hPQ92J+6qBpAeDUafojnp
 +YymiBw9qzPwdCa5Tc34aEh0ys75PI0x0sZNSyffaawqScT8rGO13HTaoYjUb8y/0q+4OmZyoVKNG
 uaw3n2HpD7PohK/UGkcvinOWeEQmkTVkmSHHWaNUmIwbbCKNQkHkZnKenzwV3sqUKfinFpms6zAaI
 9cE4jlgg==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96)
 (envelope-from <hc981@poolhem.se>) id 1pLkwl-002QAp-2m;
 Sat, 28 Jan 2023 14:08:43 +0100
Date: Sat, 28 Jan 2023 14:08:29 +0100
From: Henrik Carlqvist <hc981@poolhem.se>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: hc981@poolhem.se, qemu-devel@nongnu.org, pbonzini@redhat.com,
 atar4qemu@gmail.com, marcandre.lureau@redhat.com
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230128140829.2f5ae62c.hc981@poolhem.se>
In-Reply-To: <0f3d7351-728c-51b1-e21d-4fe13d4a4372@ilande.co.uk>
References: <20230114125029.7395a547.hc981@poolhem.se>
 <20230114153853.76b68899.hc94@poolhem.se>
 <0f3d7351-728c-51b1-e21d-4fe13d4a4372@ilande.co.uk>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=mailout12.inleed.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 22 Jan 2023 18:07:47 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> Did you see my comments re: OpenBIOS for the earlier version of this patch?

Sorry again for missing that comment, I sent a reply (
https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg05134.html )

I have now unsubscribed from the mailing list and hope that I will get copies
of any replies which then will be easier for me to note with a more reasonable
flow of emails through my inbox.

Having read about the CI gitlab issue I understand that my patch might not be
considered for integration until februari, but I am in no hurry, my first
attempt to submit this patch was in 2020 (
https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg03826.html ), that
attempt resulted in a broken patch as my mail client wrapped long lines.

Best regards Henrik

