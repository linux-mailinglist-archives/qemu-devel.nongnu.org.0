Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793D421198
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:40:39 +0200 (CEST)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXP8w-0003Vl-FG
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP6V-00011C-3N
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:38:08 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:58031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP6T-0004si-7M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:38:06 -0400
Received: from [192.168.42.227] ([37.173.140.50]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MGz5h-1mazsn1SeR-00E6Lv; Mon, 04 Oct 2021 16:38:02 +0200
Message-ID: <ff644f9a-3799-02da-d9b2-dc0f305bc6b4@vivier.eu>
Date: Mon, 4 Oct 2021 16:38:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 07/12] macfb: add qdev property to specify display type
Content-Language: en-US
From: Laurent Vivier <laurent@vivier.eu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
 <a0cc2ea6-306d-34b9-09e9-b6acb6e9876b@vivier.eu>
In-Reply-To: <a0cc2ea6-306d-34b9-09e9-b6acb6e9876b@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8ai+CKQcdvjxXj8ZMa9LAOt9+zs6fwU3TnX1BK5X2FyQqpElBTR
 jjheHGo3uD3IPXshpeVgaAYBIksnRPvtS3U2nGx+HpcTsq8+e8xyL9Fz39oNfzX9xLm8QL4
 UVrcs7lI9smKvI3rcirRdDkEXmjR2DmQqS/WfpDtw8sRv3p8vUik0vpmqfAUx25skiIysNy
 QJci/7yh1qAJTk8RwWJqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:teZF9qsKrww=:QUkMwd2IA0+kbdDl8bd7VR
 PyjPj5gJnQwDhDv0UZSQvd3p/g+g5zC2zCHiFCJpLbxwGMF/tezJqQjXobi3T/I4zBPtoo6+j
 s/nba1NuttiIpEgDj/tf1xSk8fB375xLQwAcxdbXF+WPdu0VJ9Xl/m4FzbhnSVxZMD4l7iUkr
 n0PRU+Gz8cnEpWobyQaZ4lbu1zQ2waOKDmGEmFsLtEAqpSgsbJ67vfpey5NXYbiykTJD8UAj2
 ojd67um6oI87aIMYnD7zLzyQFlj3UCDwSDI9RuvtLskpAI3tVuo0YHYvHZhWKXWosFmhVlNfc
 Wlgm2zW6U4OB0mgetFs9VTOTM2d2+TvMCiEJSR02KWqW/2zJpJgDMYQ/uEsL8aSRP/7Z/3g8G
 E82g16TLmwwaIoPJUr+yIH3XFawxE9SAav277Yuu6HJdpeVXMd0BlGxDeN+b71MzkWF2D7d+H
 YN3q5nMmlUNYCImUnsdAof2pJxf7b6NYjVt+0YIThhhDawb5s22EyC8Q8hpeLjCRkv2lefaHT
 5C8cgz7iy9Wtck8TDPvLxu7OBoBFUxx28p4/L+3dbZxnFLKUBD3FhKqXVdnNPw03+b4YJ3vfc
 QiqhbzGnCMQ7vlRc+SyoBbVswUS7kFOadE4L8MRGklodsOcShwdDNW4zwkhlbaQkHz/KmKg1p
 3Qv2x6/4n81F2FJhNfLEitn+Ji8Yp+01uSKy9UaoahwCqE9XHPOvfbMXr4vg+fVOHpsPYvJG2
 b/1O22KoUy4UGRNwRwhrR67uv0zrMPgrlyS2QA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 04/10/2021 11:24, Laurent Vivier wrote:
> Le 02/10/2021 à 13:00, Mark Cave-Ayland a écrit :
>> Since the available resolutions and colour depths are determined by the attached
>> display type, add a qdev property to allow the display type to be specified.
>>
>> The main resolutions of interest are high resolution 1152x870 with 8-bit colour
>> and SVGA resolution up to 800x600 with 32-bit colour so update the q800 machine
>> to allow high resolution mode if specified and otherwise fall back to SVGA.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c         | 6 +++++-
>>   hw/m68k/q800.c             | 5 +++++
>>   include/hw/display/macfb.h | 1 +
>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 5c95aa4a11..023d1f0cd1 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -316,7 +316,7 @@ static uint32_t macfb_sense_read(MacfbState *s)
>>       MacFbSense *macfb_sense;
>>       uint8_t sense;
>>   
>> -    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
>> +    macfb_sense = &macfb_sense_table[s->type];
>>       if (macfb_sense->sense == 0x7) {
>>           /* Extended sense */
>>           sense = 0;
>> @@ -545,6 +545,8 @@ static Property macfb_sysbus_properties[] = {
>>       DEFINE_PROP_UINT32("width", MacfbSysBusState, macfb.width, 640),
>>       DEFINE_PROP_UINT32("height", MacfbSysBusState, macfb.height, 480),
>>       DEFINE_PROP_UINT8("depth", MacfbSysBusState, macfb.depth, 8),
>> +    DEFINE_PROP_UINT8("display", MacfbSysBusState, macfb.type,
>> +                      MACFB_DISPLAY_VGA),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> @@ -552,6 +554,8 @@ static Property macfb_nubus_properties[] = {
>>       DEFINE_PROP_UINT32("width", MacfbNubusState, macfb.width, 640),
>>       DEFINE_PROP_UINT32("height", MacfbNubusState, macfb.height, 480),
>>       DEFINE_PROP_UINT8("depth", MacfbNubusState, macfb.depth, 8),
>> +    DEFINE_PROP_UINT8("display", MacfbNubusState, macfb.type,
>> +                      MACFB_DISPLAY_VGA),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index 09b3366024..5223b880bc 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -421,6 +421,11 @@ static void q800_init(MachineState *machine)
>>       qdev_prop_set_uint32(dev, "width", graphic_width);
>>       qdev_prop_set_uint32(dev, "height", graphic_height);
>>       qdev_prop_set_uint8(dev, "depth", graphic_depth);
>> +    if (graphic_width == 1152 && graphic_height == 870 && graphic_depth == 8) {
>> +        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_APPLE_21_COLOR);
>> +    } else {
>> +        qdev_prop_set_uint8(dev, "display", MACFB_DISPLAY_VGA);
>> +    }
>>       qdev_realize_and_unref(dev, BUS(nubus), &error_fatal);
>>   
>>       cs = CPU(cpu);
>> diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
>> index febf4ce0e8..e95a97ebdc 100644
>> --- a/include/hw/display/macfb.h
>> +++ b/include/hw/display/macfb.h
>> @@ -46,6 +46,7 @@ typedef struct MacfbState {
>>       uint8_t color_palette[256 * 3];
>>       uint32_t width, height; /* in pixels */
>>       uint8_t depth;
>> +    uint8_t type;
>>   
>>       uint32_t sense;
>>   } MacfbState;
>>
> 
> I think the display modes should be documentend somewhere to be directly usable by the user and get
> ride of the graphic_XXX variables (and -g).

By reading following patch I can see it's not really needed anymore, so:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

