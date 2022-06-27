Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209EF55BB1B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:24:27 +0200 (CEST)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rXG-0004cx-7Z
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAn-0007lR-2M
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:01:14 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAg-0007Xs-Tf
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:01:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 27B8B25708;
 Mon, 27 Jun 2022 16:01:05 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:01:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00618e0e2dc-2dec-4167-b6fb-82e72a910f47,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <19da941d-8717-cecf-371f-7c0b6269635a@kaod.org>
Date: Mon, 27 Jun 2022 18:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/7] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5a47e17-6971-4716-bd9f-0ff033b0b28a
X-Ovh-Tracer-Id: 15294505813468679157
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevffeigedttddvgfetjeehvdegkeetleeigeffgeduleevfeefgedvvdeftdekvdenucffohhmrghinhepmhgrgihimhhinhhtvghgrhgrthgvugdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/27/22 17:46, Jae Hyun Yoo wrote:
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> 
> Current implementation of the pmbus core driver treats the read request
> for page 255 as invalid request and sets the invalid command bit (bit 7)
> in the STATUS_CML register. As per the PMBus specification it is a valid
> request.
> 
> Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE,
> on the page 58:
>    "Setting the PAGE to FFh means that all subsequent comands are to be
>     applied to all outputs.
> 
>     Some commands, such as READ_TEMPERATURE, may use a common sensor but
>     be available on all pages of a device. Such implementations are the
>     decision of each device manufacturer or are specified in a PMBus
>     Application Profile. Consult the manufacturer's documents or the
>     Application Profile Specification as needed."
> 
> For e.g.,
> The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
> refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> 
> Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")
> 
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Changes in v2:
> * Fixed comment for a case of PB_ALL_PAGES. (Titus)
> * Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
> 
>   hw/i2c/pmbus_device.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a15e..749a33af827b 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -284,14 +284,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   
>       /*
>        * Reading from all pages will return the value from page 0,
> -     * this is unspecified behaviour in general.
> +     * means that all subsequent commands are to be applied to all output.
>        */
>       if (pmdev->page == PB_ALL_PAGES) {
>           index = 0;
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: tried to read from all pages\n",
> -                      __func__);
> -        pmbus_cml_error(pmdev);
>       } else if (pmdev->page > pmdev->num_pages - 1) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: page %d is out of range\n",


