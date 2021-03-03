Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797332BA58
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:20:51 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHXzG-0001cp-3L
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXyB-0001AC-4s
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:19:43 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:57439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHXy7-0001xQ-Jo
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:19:42 -0500
Received: from [192.168.100.1] ([82.252.139.98]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3Xvv-1lyTYN23G7-010ev4; Wed, 03 Mar 2021 21:19:32 +0100
Subject: Re: [PATCH v2 40/42] esp: add trivial implementation of the
 ESP_RFLAGS register
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-41-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2f7de1b7-d178-d5f0-cf0a-7240331576ad@vivier.eu>
Date: Wed, 3 Mar 2021 21:19:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-41-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CCGmryG5HoouMqn9/X7SbvHrJjfs+v1NP0Nm00GNJNxMTJDValI
 2P5IvF1BBMMV9BWylDHl1Y4hL4P8hT/WC4HS+4Ra6MGHmmUMhI0BDQFKRtBMiW68j3Vrs0U
 1ATMgjQHufV3UbsrSzYmqmh/WY8WEt3+eRwoxZDP3X0xMZ6TPRvIYee2L/FCdBQey5F1Jin
 Wisy2G7BwGsFj6yosmzaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7YXVVh1qQwo=:yk1hUxlj/IDqN8U5GCM2VH
 TpvqR7GhJqZgro7cv5d6COfMgh/1daVDIU6BUV/m1YQeq4td3/jBJW5HUX01+JYH5Rt+bok8W
 vtJyMTFYoF0u/KD1Ft2sxnqMdkm9bzkJOazhUAecz1Fe7NsJ/apti/vLnyNUdaxp5QqNOy+Wr
 zmlVzpDJRLIKCZ41ClXKD2nJKTLkQyQSDmddJEKFWSM/hQefccxROPotksEjXHw08/3fF0W89
 7B+tyfTDxKk4+ziMCEvEZaYmFkDurFVSD/BuHegcU1gWe4tT9bhhUy+05nY6NE3qPMhcmU3KO
 JsjukD+ZMbpBNdPnQJQyAsKwiwj5JAjmRDOK1GttOqtkkA12xu3GMwn0eruEHhTw0x8BnlIEI
 4U/6brzjlkcqWhjGGWqbqquLYXK6glgww02CStb1X+E6D7sptPW9OsqB3DFoNqWok/lkp4I1P
 x+tB7oXaNg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 09/02/2021 à 20:30, Mark Cave-Ayland a écrit :
> The bottom 5 bits contain the number of bytes remaining in the FIFO which is
> trivial to implement with Fifo8 (the remaining bits are unimplemented and left
> as 0 for now).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 9dd9947307..1f01f2314b 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -825,6 +825,10 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
>              val = s->rregs[saddr];
>          }
>          break;
> +     case ESP_RFLAGS:
> +        /* Bottom 5 bits indicate number of bytes in FIFO */
> +        val = fifo8_num_used(&s->fifo);
> +        break;
>      default:
>          val = s->rregs[saddr];
>          break;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

