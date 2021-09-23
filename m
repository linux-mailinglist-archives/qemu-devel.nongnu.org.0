Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8976415EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:53:36 +0200 (CEST)
Received: from localhost ([::1]:36588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOEH-0002u8-QD
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTO4v-0005yj-Ax; Thu, 23 Sep 2021 08:43:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mTO4t-0006Xx-3h; Thu, 23 Sep 2021 08:43:52 -0400
Received: from [192.168.15.189] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 14EF120786;
 Thu, 23 Sep 2021 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632401026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74J5uL4+y3OkwakSUEbDd5pmG2azKhrylHgHqUMTlRo=;
 b=NqrdEZvIHKxKmAWJ08TREruX+6E1zwtjlIzFRKUJ8z/RjI58v7xHMihe/01vIPrVrKra7T
 niGWbOMLvL+/r6m0yCRL3pyfXGhri4PRKFkmCm8kOkiTf9h5mxH1Qh61DdQIQpDW1ISlel
 hpLot1xPahP9abOARHX6kwVUlJhMYeU=
Message-ID: <e3ab341b-3e7a-1485-90ed-dbd9d2e3588d@greensocs.com>
Date: Thu, 23 Sep 2021 14:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
 <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <d27c5829-e28f-4d17-966e-6cb86ebe00e6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/22/21 19:37, Philippe Mathieu-Daudé wrote:
> On 9/22/21 18:13, Damien Hedde wrote:
>> From: Mirela Grujic <mirela.grujic@greensocs.com>
>>
>> The command returns current machine initialization phase.
>>  From now on, the MachineInitPhase enum is generated from the
>> QAPI schema.
>>
>> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> 
> Missing your S-o-b, otherwise:

Sorry. I did not realize I had to add it since it was already done by 
Mirela. I'll add it for this patch and patches 1, 6 and 8.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com >
>> ---
>>   qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>>   include/hw/qdev-core.h     | 30 ++------------------
>>   hw/core/machine-qmp-cmds.c |  9 ++++++
>>   hw/core/qdev.c             |  5 ++++
>>   4 files changed, 72 insertions(+), 28 deletions(-)
> 

