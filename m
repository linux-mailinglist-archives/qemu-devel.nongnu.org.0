Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C22F3C56
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:30:18 +0100 (CET)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzSB7-00049B-4H
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzS9H-0003Xe-GC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:28:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kzS9E-0004cm-05
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:28:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610490497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wB3b/cQWqJOAl35Zte45QxPGkw6EOcR3psFNYLVadf4=;
 b=RU6hVQRKxNvv0GcCyIysGeu+aZFi0nWYYpawJvEDOZG66WFps5CM963Z6xMhHvZlmAjBpp
 XhZti40eEvDw/z15JUOTmPpFcnVzSbGhi0c4WgKDf72DYyKr+zSi4p6UIv054cMaHUBpfT
 j+oM+W7cCdUPCq3KKiKgTb6BOmogvUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-_FdhzN1WP6OYZV7H7rRHYg-1; Tue, 12 Jan 2021 17:28:12 -0500
X-MC-Unique: _FdhzN1WP6OYZV7H7rRHYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7883D8030A0;
 Tue, 12 Jan 2021 22:28:11 +0000 (UTC)
Received: from localhost (ovpn-119-212.rdu2.redhat.com [10.10.119.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 155705C1B4;
 Tue, 12 Jan 2021 22:28:10 +0000 (UTC)
Date: Tue, 12 Jan 2021 17:28:09 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] decodetree: Allow 'dot' in opcode names
Message-ID: <20210112222809.GD4161@habkost.net>
References: <20210112184156.2014305-1-f4bug@amsat.org>
 <7fd434f1-aa6d-f4db-b741-564a33a8540a@linaro.org>
 <2d6ffc43-51b1-e565-6dc5-6985ed43ccc5@amsat.org>
MIME-Version: 1.0
In-Reply-To: <2d6ffc43-51b1-e565-6dc5-6985ed43ccc5@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 11:15:38PM +0100, Philippe Mathieu-Daudé wrote:
> On 1/12/21 9:44 PM, Richard Henderson wrote:
> > On 1/12/21 8:41 AM, Philippe Mathieu-Daudé wrote:
> >> Some ISA use a dot in their opcodes. Allow the decodetree
> >> script to process them. The dot is replaced by an underscore
> >> in the generated code.
> > 
> > Given that you then have to remember to use '_' on the C side, what advantage
> > does this give?
> 
> The direct advantage is you can copy/paste the opcode in a PDF viewer
> without having to edit it :)
> 
> See i.e. some Loongson opcodes [*]:
> 
> MULT.G          011100 ..... ..... ..... 00000 010000   @rs_rt_rd
> DMULT.G         011100 ..... ..... ..... 00000 010001   @rs_rt_rd
> MULTU.G         011100 ..... ..... ..... 00000 010010   @rs_rt_rd
> DMULTU.G        011100 ..... ..... ..... 00000 010011   @rs_rt_rd
> 
> DIV.G           011100 ..... ..... ..... 00000 010100   @rs_rt_rd
> DDIV.G          011100 ..... ..... ..... 00000 010101   @rs_rt_rd
> DIVU.G          011100 ..... ..... ..... 00000 010110   @rs_rt_rd
> DDIVU.G         011100 ..... ..... ..... 00000 010111   @rs_rt_rd
> 
> MOD.G           011100 ..... ..... ..... 00000 011100   @rs_rt_rd
> DMOD.G          011100 ..... ..... ..... 00000 011101   @rs_rt_rd
> MODU.G          011100 ..... ..... ..... 00000 011110   @rs_rt_rd
> DMODU.G         011100 ..... ..... ..... 00000 011111   @rs_rt_rd
> 
> The other - remote - advantage I see is when using a disassembler
> based on decodetree (as AVR does), the opcode displayed also matches
> the specs. We are not yet there with MIPS, but I have something in
> progress...

Interesting.  So, the decodetree format is not used exclusively
inside the QEMU source tree, but also by other projects?  Is
there a specification somewhere else?

> 
> [*] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg02509.html
> 

-- 
Eduardo


