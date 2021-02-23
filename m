Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A8322710
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:25:29 +0100 (CET)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lET0b-0001cY-0Y
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lESzq-0001CS-J1
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:24:42 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33618
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lESzo-0004VR-UQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 03:24:42 -0500
Received: from host31-48-197-98.range31-48.btcentralplus.com ([31.48.197.98]
 helo=[192.168.1.110]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lESzX-0000OR-Rx; Tue, 23 Feb 2021 08:24:24 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
 <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
 <ce56bbc6-8467-db6d-599d-c52c56ad6f5f@ilande.co.uk>
 <e86ba2e0-c023-b2fa-6c38-d9fe762bba50@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <73445020-bb50-e3d6-07b1-a72b6b5e80bf@ilande.co.uk>
Date: Tue, 23 Feb 2021 08:24:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e86ba2e0-c023-b2fa-6c38-d9fe762bba50@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 31.48.197.98
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2021 07:30, Philippe Mathieu-Daudé wrote:

>> Are you planning to review any more of this series? I'm keen to put out
>> a (hopefully final) v3 soon, but I'll hold off for little while if you
>> want more time to look over the remaining patches.
> 
> I talked about this series with Laurent on Sunday, asking him for
> review help ;) I don't remember if there is any big comment to
> address in patches 1-14. If not I can review the missing ones
> there today and you could send directly a pull request for this
> first set, then send the rest as v3. Does that help?
> For the rest I doubt having time to focus before Friday.

Hi Phil/Laurent,

I know you're both really busy, but gentle ping to ask if anyone is still planning to 
review the second half of this patchset? :)


ATB,

Mark.

