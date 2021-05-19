Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE25F3898B5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 23:40:23 +0200 (CEST)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljTvS-0003Ph-Vh
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 17:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTuN-0002En-4z
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTuL-00009d-9b
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621460352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ7lNPKmMPxGmZeOJwzscahrY/F6jIKYYhPKqJdyXLU=;
 b=Cbp3q6/Ie/fQPzSPBhrr5eTQ7zAmpfQnDrwVaIjdidjIlQjkCqGCs6QOiN0rXf7+MnYZFM
 F3TE5CYjL/1ElQjEk1S0wvUhbwWf4PDUonIiEW0Uq5EXoihxImIp6/Gh6kSvFRnAYajPoo
 2IGm21NNFJy09b+VJGKgyylki3z120k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-8VEQFpzfN6-1SBVnzPTqVw-1; Wed, 19 May 2021 17:39:10 -0400
X-MC-Unique: 8VEQFpzfN6-1SBVnzPTqVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC251009468
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 21:39:09 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 538B219C59;
 Wed, 19 May 2021 21:39:09 +0000 (UTC)
Subject: Re: [PATCH v6 0/5] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210519163448.2154339-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <07fb087d-38dd-15ce-b04f-2dbc06a103e4@redhat.com>
Date: Wed, 19 May 2021 17:39:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519163448.2154339-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Since v5:
> - Added stub (thuth)
> 
> Since v4:
> - Dropped machine patches for later due to DMA jazz issue
> 
> Since v3:
> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
> 
> Since v2:
> - rebased
> 
> Since v1:
> - added missing "hw/block/block.h" header (jsnow)
> - inlined hardware specific calls (Mark)
> - added R-b/A-b tags
> 
> Regards,
> 
> Phil.
> 

Tentatively staged to floppy branch again.

Allowing Paolo/Thomas et al a chance to reject 01/05 it before sending a PR.

(I am also, unrelatedly, waiting on PJP to send more patches for FDC and 
I will collect all the FDC patches together and send. Thanks!)

--js


