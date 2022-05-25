Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86D7534629
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 00:02:59 +0200 (CEST)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntz5m-0007BA-Uq
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 18:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntz4O-00069a-JT; Wed, 25 May 2022 18:01:32 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:52619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntz4L-0001Ee-J0; Wed, 25 May 2022 18:01:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtOX2-1nYTAy1zzS-00uu4Q; Thu, 26 May 2022 00:01:22 +0200
Message-ID: <712616db-f1ea-cda3-9dea-dccfc457deeb@vivier.eu>
Date: Thu, 26 May 2022 00:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/11] scsi-disk: add FORMAT UNIT command
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uF/ImDdyHi5xtPj2kxseuDK6czUcMsqQjM00eC+TnxeANIcKGZb
 eTdpqkHUMtPk2qvbawmhVNP7jSdsRYBJ3ZUX9dMmfExQ7LLMGUDWnlv9u48NQ4JhDuHuQoq
 tyM8/VxreIVzWPqzVR4xzVbk1dpkdTM6+HrWl9O32Ci6Kl5E6DJdbqjTgabe+thHTrGc5Vb
 5vvKhW/hpaLu/IFaxr9jw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X1KBjZ4IR+c=:TZcyDQZTTbACktEDMYgVDR
 XSvgysSl4RL+MtFKwZuYg9HIkpsPqvCLfU5lImqZjEFwvasATjFrw0Fyo90bfj1ssf8ImRDhW
 IqsRgcGx1C5RvLEJmfrGiygnsPrOiApEZUeNlvX5t5Cxq7sfx40YSH4SQzIiyU9gvKxxp0NDY
 bYNj1g0Q9/7KKn9syhDYH2fHuuM9WowuAg5McNRym+l0b0cgvgdI9VYmdCjAe+krM2EY8DSBY
 I02v/imCx8kjZzlQ3GphQ1WCcJEMC+/5gTXYLVG5YI/Owf7LGqXoO0r+yH1pByknKgK76cLcJ
 9sQoG3meXh8betC8S1JU9Y+SBPkFCEa7VkvnkF1Phjq6l1rwXfpCxMQxbadhxKR3UDpMr/nic
 IrLNHZ83M3Df2N4fF0HHmwQrO0szSaYm4L2iO0SIG7bT+9+Cq7jl7Xv+f6l7rXooRE/alKYjL
 6xrNKbXaJuVdtcrJSZ0pzUeRQ2oxIdsF5r1GmDdK9IIFCDWhXvU7dTlS24Ke3Aauf7CbWI9mI
 uJlHnixeTQc74EVxTsQwcPE/G4lb/LNZ8/7dIf5kt4SOiUOdU4N1F367lhufNM/rDcebrdLWR
 DGvTknI3VUK+te3yu1swhXZHTFOOy4cQJS0ALXdxY1muka8vSIpQHDhR/oFDrsBIqcYnPFxkM
 mrTwjooPJ7Ep409rHg9LmJRdj4WsCEgIgXV/828Dl95pkNXNCqM9XCbKEPvF+2Rq3f6HRAR/d
 /AgohZwUDGQpvbn6qpyMmG0dfYfmebXoq7ku5g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 24/04/2022 à 18:49, Mark Cave-Ayland a écrit :
> When initialising a drive ready to install MacOS, Apple HD SC Setup first attempts
> to format the drive. Add a simple FORMAT UNIT command which simply returns success
> to allow the format to succeed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/scsi-disk.c  | 4 ++++
>   hw/scsi/trace-events | 1 +
>   2 files changed, 5 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.Eu>


