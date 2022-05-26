Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6781534FA0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:53:10 +0200 (CEST)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCzF-0001dV-Oz
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCwV-0007ry-DU; Thu, 26 May 2022 08:50:19 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:46579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nuCwT-0000S9-GW; Thu, 26 May 2022 08:50:19 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBltK-1nzg2c2R3M-00CEFe; Thu, 26 May 2022 14:50:06 +0200
Message-ID: <6770e5da-0025-b0ba-f5bd-b0940f6b0f51@vivier.eu>
Date: Thu, 26 May 2022 14:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 03/11] scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for
 Macintosh
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
 <20220424164935.7339-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220424164935.7339-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ey/3pQpU1tjTFyzjbOH6WGD6rdC2g79PHdEPSbm/Ff2vX10NGel
 SiIic2zIdb9HDUD2B/0a/fWO8MbHRhdlw1PPZP/M5RzfUGhs8929tKfGQUPAomxDAWWX8B2
 xv1OdF18ogmxZ3VfxNmyOfsktmK2j26ZzmGgaqOgLDjk2SRYgDfNY8JNPxjlk8Ab+JT+Yft
 uSgkbPTyMK3yIspTzE7FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o/2sufoEPTA=:BOtwqiP6qA0gqStZfHismf
 96HKuzTRMU1wlg4jFeZaXabi0GhnaBQ9vG+zZdp4OiKgww4yDcMcyRswiC5zUWs1j3y0AUUTI
 OqNBVoOOKa1kpA2haNrtrUsjVJmMA/Qp/OuMcty3PAdiKxjMwIbHpi8FiRvj6gnFhi5H7Tsql
 ZLNVvxVWRcVbQ0gt7tSkpl678kAPfqk7nPDQeoIrcpTY/+u/njAY0WvR1qjEsRqCxBl/mtgf3
 sJY/6zQV8eyACK1FF7fVKzY96yDXkV3jkgH630XRmd3wZbpRKJYSXOXKgFaRQGm5rqXlh9oQ5
 qaMhKOQ/7T9XQYk5CmHTTm9XkoNC+7uTQZ3jk1COk7lWzL+aI0IIqYxBXyny6zqOrDFozH/cw
 jgzzq8rep6BDH7XGCdLvKYb8usoUfcPXTxpxvRjPX1UHWcfyJ5CC4dHOjk25S2t1ACYEJwek0
 HVq0SCfkyIHqaikqMts8TpN5KSbrvA1UOqjY9Uh1JtBe6+w1qRBq5T1ytFoUMhPtGzH7lpCNF
 VaBfV9r1nmUqqfcykH+EkLwnSeEoD4aLR72wXHjuuRZh5d3B8q2rZ4esEo8Dd7ApS/KnGajN/
 m8fEBzmNTMK2A5O7OmVju6P3z/2f1hgURpmt0Tnep6IdJonfh9H/mssITA6yst908JDyYdGnJ
 wH6ceq6EjoeWoTPSF1NeHF/qd2n7tWtLN2k8OS8trK8j6VK7RyDisYjh7GdSqNFSUicn1/w4J
 UHNiuP9OJoBPsct6K2W+ECK1Y5EfLvUSeTAjVA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> One of the mechanisms MacOS uses to identify drives compatible with MacOS is to
> send a custom MODE SELECT command for page 0x30 to the drive. The response to
> this is a hard-coded manufacturer string which must match in order for the
> drive to be usable within MacOS.
> 
> Add an implementation of the MODE SELECT page 0x30 response guarded by a newly
> defined SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR quirk bit so that drives attached
> to non-Apple machines function exactly as before.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/scsi-disk.c      | 17 +++++++++++++++++
>   include/hw/scsi/scsi.h   |  3 +++
>   include/scsi/constants.h |  1 +
>   3 files changed, 21 insertions(+)
> 
> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> index d89cdd4e4a..5de4506b97 100644
> --- a/hw/scsi/scsi-disk.c
> +++ b/hw/scsi/scsi-disk.c
> @@ -1085,6 +1085,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>           [MODE_PAGE_R_W_ERROR]              = (1 << TYPE_DISK) | (1 << TYPE_ROM),
>           [MODE_PAGE_AUDIO_CTL]              = (1 << TYPE_ROM),
>           [MODE_PAGE_CAPABILITIES]           = (1 << TYPE_ROM),
> +        [MODE_PAGE_APPLE_VENDOR]           = (1 << TYPE_ROM),
>       };
>   
>       uint8_t *p = *p_outbuf + 2;
> @@ -1229,6 +1230,20 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
>           p[19] = (16 * 176) & 0xff;
>           break;
>   
> +     case MODE_PAGE_APPLE_VENDOR:
> +        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR)) {
> +            length = 0x24;
> +            if (page_control == 1) { /* Changeable Values */
> +                break;
> +            }
> +
> +            memset(p, 0, length);
> +            strcpy((char *)p + 8, "APPLE COMPUTER, INC   ");
> +            break;
> +        } else {
> +            return -1;
> +        }
> +
>       default:
>           return -1;
>       }
> @@ -3042,6 +3057,8 @@ static Property scsi_hd_properties[] = {
>       DEFINE_PROP_UINT16("rotation_rate", SCSIDiskState, rotation_rate, 0),
>       DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
>                         5),
> +    DEFINE_PROP_BIT("quirk_mode_page_apple_vendor", SCSIDiskState, quirks,
> +                    SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
>       DEFINE_BLOCK_CHS_PROPERTIES(SCSIDiskState, qdev.conf),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index 1ffb367f94..975d462347 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -226,4 +226,7 @@ SCSIDevice *scsi_device_get(SCSIBus *bus, int channel, int target, int lun);
>   /* scsi-generic.c. */
>   extern const SCSIReqOps scsi_generic_req_ops;
>   
> +/* scsi-disk.c */
> +#define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR     0
> +
>   #endif
> diff --git a/include/scsi/constants.h b/include/scsi/constants.h
> index 2a32c08b5e..891aa0f45c 100644
> --- a/include/scsi/constants.h
> +++ b/include/scsi/constants.h
> @@ -234,6 +234,7 @@
>   #define MODE_PAGE_FAULT_FAIL                  0x1c
>   #define MODE_PAGE_TO_PROTECT                  0x1d
>   #define MODE_PAGE_CAPABILITIES                0x2a
> +#define MODE_PAGE_APPLE_VENDOR                0x30
>   #define MODE_PAGE_ALLS                        0x3f
>   /* Not in Mt. Fuji, but in ATAPI 2.6 -- deprecated now in favor
>    * of MODE_PAGE_SENSE_POWER */

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

