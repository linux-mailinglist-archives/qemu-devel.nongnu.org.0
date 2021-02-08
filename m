Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFF313AEF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:30:55 +0100 (CET)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ANA-0000Ii-Eg
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@dantalion.nl>)
 id 1l92fF-0006wD-2E; Mon, 08 Feb 2021 04:17:06 -0500
Received: from s02.spamexperts.axc.nl ([185.182.56.112]:41269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@dantalion.nl>)
 id 1l92ex-0004ES-Nj; Mon, 08 Feb 2021 04:16:52 -0500
Received: from vserver22.axc.nl ([185.182.56.82])
 by s02.spamexperts.axc.nl with esmtps (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <info@dantalion.nl>)
 id 1l92eR-0005fB-Th; Mon, 08 Feb 2021 10:16:14 +0100
Received: from mail.axc.nl ([185.182.56.42])
 by vserver22.axc.nl with esmtp (Exim 4.94)
 (envelope-from <info@dantalion.nl>)
 id 1l92eN-006Ywg-VD; Mon, 08 Feb 2021 10:16:08 +0100
Subject: Re: [PATCH] hw/block/nvme: improve invalid zasl value reporting
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210208082532.308435-1-its@irrelevant.dk>
From: "info@dantalion.nl" <info@dantalion.nl>
Autocrypt: addr=info@dantalion.nl; prefer-encrypt=mutual; keydata=
 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 4W8=
Message-ID: <75433660-5650-8598-2143-4158113acb8e@dantalion.nl>
Date: Mon, 8 Feb 2021 10:15:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208082532.308435-1-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
PrimaryMX: Accepted email from trusted host. Hint: This skips spam scanning so
 make sure other host is not vulnerable
SPFCheck: Server passes SPF test, -30 Spam score
X-Relay-Host: 185.182.56.42
X-Spam-Score: -0.0 (/)
SpamTally: Final spam score: -240
X-AuthUser: 
X-Originating-IP: 185.182.56.82
X-SpamExperts-Domain: vserver22.axc.nl
X-SpamExperts-Username: 185.182.56.82
Authentication-Results: spamexperts.axc.nl;
 auth=pass smtp.auth=185.182.56.82@vserver22.axc.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.24)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+xFyn7UpOfXpFArqGBGHkFPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ztiSaqv/sNYOK695xQdppmCLjLBn1wYuSvIF4e3KzZojG5
 C63/N5EDq8oyzDJb6EZvqSw8mtxiGkHxbIBNrJOO1waTp18hu7Ap15ORuodK5a8YId92UViWHoTV
 eB80IoKJB1fUujzIKNJ/JN+YYUAQCvS7vfsvzznj4MbZ8N8ZbRT7VrVXjxWkjZezb/t4RauhSW0b
 rGCDkk6BtWuMI8QceR0PkgL7XdLriKeF2GnmQiyqiLHsymdThTN4a9AzcO/ZZ4m5d73AalZr0AeA
 NfGnABYpWiD6jthR3LhrYx1EZAFV4q2y7iY8tzbZxli25wTUzDXlSdVlFk6WFLkAI2e44a51G/uF
 LRsk3N5pINuR0KWXYl6o5wPR17y6MMUdaD1eou7UrY5IH3nSH48f4DFOYJLx+ShSuLRnWIuhjHu1
 M9vrQQT37tVBF8TuA2zDxdadd1WxHO/mLVgwAb47uaavm9UcoHzDPg3KdwIGKsV+GwO5pbaJSnle
 SF++QBmW0+JLz719Fo7MPwmpyNqirHCp+dSXORr4Pw0tJTUf0N+OPxAOEG9YXRA3MZxvhadh2za2
 BP//e9fyD640rR6vrC7b+n+PFurydWF88IP8h3QaHmqgloBO0Md+1AP7gSewVgGviDjv91eo0UZ8
 9SN0jhflhJ1rNafcM+7I2umwHVcAVfRgA/iFSrQy26BCg+0MdOxStsE0VwD00QB/QYj1k74hheuH
 d5yCytEkfKKmadwSLa9WJmbhekdrgcJsDlHBdajlsWJoA/N4L72OMz//UQUP9eDSb8uPZeTInj9W
 8KDQChWTHgrkPgnGuCbpAOtSc3EoxDzJIuXQrgflh/+BZ7ff1Bwskv/At6tTSrKiQ8hxBJNDFbIp
 BHHN4xcCmG9gY4NQYZXwkeIbH6wm+OdzDu9CwUUm4fxMxlMrTnPOUGl8HglOZNtk23EZmAz5KWqj
 j+Nc9aUV1oY4fX3W5eOCNA390RBmR5wlnpqJqFgl67SEGGmjt+WmIH2jK0JKToDuuwlwABIGM6BK
 zOKSxLno7T+WNabv730Q+kyQtJfaoIHIcEpoEhF42+g7svTRzRl28U5U60QcMUqZkpwHRYq5y4an
 IrxWNHPOt+2oZfQ4kqp7qD4t5H5Z+gqo56Hj7YyFwss0ljctp4B0nbKdQK2TrOR+
X-Report-Abuse-To: spam@s01.spamexperts.axc.nl
Received-SPF: pass client-ip=185.182.56.112; envelope-from=info@dantalion.nl;
 helo=s02.spamexperts.axc.nl
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Feb 2021 09:34:48 -0500
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08-02-2021 09:25, Klaus Jensen wrote:
> The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
> improve the user experience by adding an early parameter check in
> nvme_check_constraints.

I have confirmed this and it works for me, I don't think I am actually
qualified or understand QEMUs source well enough to sign this off but
just wanted to let you know.

Thanks for the quick updates.

Kind regards,
Corne

