Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5806E8E05
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:25:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQWz-0002Y5-TD; Thu, 20 Apr 2023 05:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQWx-0002Xx-Sd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:24:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQWw-0007f5-Ap
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ilJ8b7wm08S5cNoMRwZ7ZSj6f8FugSRGvC6Ht3a3z10=; b=ETDxgF05+SdySMi9w7rxYHTrLE
 n1JLIy8oaPIM68A71Q6B2Kd7WNYWpQ7B5ySITdQpxxAA6SOWp6Nc7JF6SEDweZCVWFnzWT4j+5nlE
 3+H0gMh0H4f9ss7D1tVNCtTdk/aP2/ozsMMYF2sN1DFjLsGwjz1v5DUI3/HE0/Mk4/kAxCkzGYRMX
 SL+K9n3B6fp2nrdmbeqO5MfyrxFxtLKd5EMA2JitPNHUdPDkC0GmpKM/jQVUfpOoYcA86iKkICjHz
 xVVrF6Kj1672ouT0Sh9/iA32sDoxGK9Y+Ajuk19DGB1bYwMqaXFktKhQbvO7Afj9JGAjsnpv/LggK
 DR2zaxBdPCYMgkW/5/+fyVLlgrPgSCZcHZdSJJZQ0BnncWM4szCJUuWWDv46x2DqRJws4/f0TrwfV
 j34KLL+bmIYhw1KtKrHHsz6ZBDkR160wAQPbx9cUKoXU/NQ8HeMfsUddIvly8lEpEPIeNGGky1sAe
 IdaJbhFUk7cHn/Jj5leiCir1BiXqr/+BqhSZ2w3WazHFuNCWS32eyKPOuf/E3VcJbtsMI/nTh55lh
 ICW6OMRrp/T0EHfkh/91tBHiZrvPJbTJWPa+QZf2vPlgXTPZXEhc9C3mcymS0Ep4paAhSJRIGvqDe
 /Rkd+MJ+CA3YCIetyMhTmMqMKnesyo+LjgNnyNCB8=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQW0-0009pQ-KE; Thu, 20 Apr 2023 10:23:48 +0100
Message-ID: <ae8405c3-4c14-8e5c-8353-d1c96455c8e4@ilande.co.uk>
Date: Thu, 20 Apr 2023 10:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtio-fs@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
 <20230418162140.373219-3-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230418162140.373219-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 02/13] include/hw: document the
 device_class_set_parent_* fns
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 17:21, Alex Bennée wrote:

> These are useful functions for when you want proper inheritance of
> functionality across realize/unrealize calls.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/qdev-core.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index d4bbc30c92..b1d194b561 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -795,9 +795,36 @@ void device_class_set_props(DeviceClass *dc, Property *props);
>   void device_class_set_parent_reset(DeviceClass *dc,
>                                      DeviceReset dev_reset,
>                                      DeviceReset *parent_reset);
> +
> +/**
> + * device_class_set_parent_realize(): set up for chaining realize fns
> + * @dc: The device class
> + * @dev_realize: the device realize function
> + * @parent_realize: somewhere to save the parents realize function
> + *
> + * This is intended to be used when the new realize function will
> + * eventually call its parent realization function during creation.
> + * This requires storing the function call somewhere (usually in the
> + * instance structure) so you can eventually call:

I think this should be the class structure, since it is the only possible location 
for the parent realize() function to exist given that these functions are called from 
the .class_init function.

> + *   my_dev->parent_realize(dev, errp);
> + */
>   void device_class_set_parent_realize(DeviceClass *dc,
>                                        DeviceRealize dev_realize,
>                                        DeviceRealize *parent_realize);
> +
> +
> +/**
> + * device_class_set_parent_unrealize(): set up for chaining unrealize fns
> + * @dc: The device class
> + * @dev_unrealize: the device realize function
> + * @parent_unrealize: somewhere to save the parents unrealize function
> + *
> + * This is intended to be used when the new unrealize function will
> + * eventually call its parent unrealization function during the
> + * unrealize phase. This requires storing the function call somewhere
> + * (usually in the instance structure) so you can eventually call:
> + *   my_dev->parent_unrealize(dev);

And same here of course.

> + */
>   void device_class_set_parent_unrealize(DeviceClass *dc,
>                                          DeviceUnrealize dev_unrealize,
>                                          DeviceUnrealize *parent_unrealize);


ATB,

Mark.

