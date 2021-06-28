Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4C3B59BC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:29:05 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxlhY-0006Sn-Sc
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lxlfq-0005c5-N2; Mon, 28 Jun 2021 03:27:18 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:57879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lxlfg-0008KW-Kq; Mon, 28 Jun 2021 03:27:18 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id D862213FB61;
 Mon, 28 Jun 2021 07:27:03 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Mon, 28 Jun
 2021 09:27:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006dbd837fc-9396-4f81-b735-3dfe85cfda99,
 A5942444232ACF3D755B1638A42E9F49C81D83AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH 03/10] hw/sd: Move proto_name to SDProto structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-4-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4e4c2233-5a55-1370-40db-fdc977f5fdbb@kaod.org>
Date: Mon, 28 Jun 2021 09:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624142209.1193073-4-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3e9ef407-78df-47aa-bec3-8b2cc50aaa29
X-Ovh-Tracer-Id: 8774982399692737318
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:22 PM, Philippe Mathieu-Daudé wrote:
> Introduce a new structure to hold the bus protocol specific
> fields: SDProto. The first field is the protocol name.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index d71ec81c22a..a1cc8ab0be8 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -88,6 +88,10 @@ enum SDCardStates {
>      sd_disconnect_state,
>  };
>  
> +typedef struct SDProto {
> +    const char *name;
> +} SDProto;


Why not use an Object class ? 

C.


> +
>  struct SDState {
>      DeviceState parent_obj;
>  
> @@ -112,6 +116,7 @@ struct SDState {
>  
>      /* Runtime changeables */
>  
> +    const SDProto *proto;   /* Bus protocol */
>      uint32_t mode;    /* current card mode, one of SDCardModes */
>      int32_t state;    /* current card state, one of SDCardStates */
>      uint32_t vhs;
> @@ -138,7 +143,6 @@ struct SDState {
>      qemu_irq readonly_cb;
>      qemu_irq inserted_cb;
>      QEMUTimer *ocr_power_timer;
> -    const char *proto_name;
>      bool enable;
>      uint8_t dat_lines;
>      bool cmd_line;
> @@ -951,8 +955,8 @@ static bool address_in_range(SDState *sd, const char *desc,
>  
>  static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
>  {
> -    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
> -                  req.cmd, sd_state_name(sd->state));
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: CMD%i in a wrong state: %s\n",
> +                  sd->proto->name, req.cmd, sd_state_name(sd->state));
>  
>      return sd_illegal;
>  }
> @@ -966,7 +970,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>       * However there is no ACMD55, so we want to trace this particular case.
>       */
>      if (req.cmd != 55 || sd->expecting_acmd) {
> -        trace_sdcard_normal_command(sd->proto_name,
> +        trace_sdcard_normal_command(sd->proto->name,
>                                      sd_cmd_name(req.cmd), req.cmd,
>                                      req.arg, sd_state_name(sd->state));
>      }
> @@ -1526,7 +1530,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  static sd_rsp_type_t sd_app_command(SDState *sd,
>                                      SDRequest req)
>  {
> -    trace_sdcard_app_command(sd->proto_name, sd_acmd_name(req.cmd),
> +    trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
>                               req.cmd, req.arg, sd_state_name(sd->state));
>      sd->card_status |= APP_CMD;
>      switch (req.cmd) {
> @@ -1820,7 +1824,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
>      if (sd->card_status & (ADDRESS_ERROR | WP_VIOLATION))
>          return;
>  
> -    trace_sdcard_write_data(sd->proto_name,
> +    trace_sdcard_write_data(sd->proto->name,
>                              sd_acmd_name(sd->current_cmd),
>                              sd->current_cmd, value);
>      switch (sd->current_cmd) {
> @@ -1976,7 +1980,7 @@ uint8_t sd_read_byte(SDState *sd)
>  
>      io_len = (sd->ocr & (1 << 30)) ? 512 : sd->blk_len;
>  
> -    trace_sdcard_read_data(sd->proto_name,
> +    trace_sdcard_read_data(sd->proto->name,
>                             sd_acmd_name(sd->current_cmd),
>                             sd->current_cmd, io_len);
>      switch (sd->current_cmd) {
> @@ -2095,6 +2099,14 @@ void sd_enable(SDState *sd, bool enable)
>      sd->enable = enable;
>  }
>  
> +static const SDProto sd_proto_spi = {
> +    .name = "SPI",
> +};
> +
> +static const SDProto sd_proto_sd = {
> +    .name = "SD",
> +};
> +
>  static void sd_instance_init(Object *obj)
>  {
>      SDState *sd = SD_CARD(obj);
> @@ -2115,7 +2127,7 @@ static void sd_realize(DeviceState *dev, Error **errp)
>      SDState *sd = SD_CARD(dev);
>      int ret;
>  
> -    sd->proto_name = sd->spi ? "SPI" : "SD";
> +    sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
>  
>      switch (sd->spec_version) {
>      case SD_PHY_SPECv1_10_VERS
> 


