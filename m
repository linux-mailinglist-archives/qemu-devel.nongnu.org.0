Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA827B1AB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 18:19:03 +0200 (CEST)
Received: from localhost ([::1]:51156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMvri-0002G4-3A
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 12:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joakim.bech@linaro.org>)
 id 1kMtZX-0001bx-Q9
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 09:52:08 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joakim.bech@linaro.org>)
 id 1kMtZV-00075N-NK
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 09:52:07 -0400
Received: by mail-ej1-x643.google.com with SMTP id gx22so8636208ejb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=IhcY/dhAlneLGJSZUZRYJHBDvn10aN7xjhS/dhjJ6Zo=;
 b=CNNWh+0VvlMpTMWvK2bMZxPdYfy+076w6/qaGe1GdaMizs+y43k1xhzedjZQEDPC3S
 Yfqf7ROY//oGmwVObORBsKaSKGyhnSUjAdvEc3O8avPtez5KheY15o3E+YlLwVYX3OVt
 ZFXUrvLhYXd6VwzuGQojzdqAoc4yAubpNJUkLx/x1rgCflO4IrAI1bgqWLaKvr6JDl44
 qVTRNP7RpttOs6yUvCy/+yn0oltez5nTAZfMYwSaLnfvxgdqPkyT+eUPksUu5YGHO6yK
 eG3U9za6Y68caKOzX5YCdpV8boNVR8iMuPTgHFM4G3jo1NfXQzDQ7TvUGGF2t6XeuGky
 qb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IhcY/dhAlneLGJSZUZRYJHBDvn10aN7xjhS/dhjJ6Zo=;
 b=K8KZEp1ivIWkH+6vXGQDszhUMjVnItyaqSttJHAzUl0wYXaKSUjE+gaGsEbdNJNMQb
 02jbRfSNwsSsojDbT1caL4n8MPqH6QYi+raWPhY7xrbtPJ+iH4LizJG4tDpcz6a3IYTu
 gfKgBFMuXyCwQ0VHLy22FjiimtfJxX06rWFqaE49XOD6z8ZvwJ117zfuYc2ATUgDpdd/
 BUDKtsVwpp5kKeex9XxOe9JEAFB+kWcBLuDoj69FUl2IJdk84MD9vREy1kuebybFM12a
 kHltbg1ZFPPxkR7E4uNFdMmnWV09BH7QCfYfgYT+XCbJGUIjDp0WMjNN1jQ6232lrAvC
 /ZzA==
X-Gm-Message-State: AOAM5300F917YA+euJsEcpY02r+bi/zTbnA1KLTace2KNyTBFUfLM/EQ
 GGh+qzqilkpDDKtXvndOc3MSMw==
X-Google-Smtp-Source: ABdhPJzSH0ob09T8rhxXiGKk8DppEaTWFmLpVrWHmVUSYC6JcOOArbIdAx59E1pAZL6STHPjFr1cqA==
X-Received: by 2002:a17:906:6007:: with SMTP id
 o7mr1841450ejj.550.1601301123286; 
 Mon, 28 Sep 2020 06:52:03 -0700 (PDT)
Received: from goby (81-231-61-187-no276.tbcn.telia.com. [81.231.61.187])
 by smtp.gmail.com with ESMTPSA id h18sm1748849edt.75.2020.09.28.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 06:52:02 -0700 (PDT)
Date: Mon, 28 Sep 2020 15:52:01 +0200
From: Joakim Bech <joakim.bech@linaro.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH  15/19] tools/vhost-user-rpmb: implement
 VIRTIO_RPMB_REQ_DATA_WRITE
Message-ID: <20200928135201.GA9143@goby>
References: <20200925125147.26943-1-alex.bennee@linaro.org>
 <20200925125147.26943-16-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200925125147.26943-16-alex.bennee@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=joakim.bech@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2020 12:17:19 -0400
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
Cc: jean-philippe@linaro.org, maxim.uvarov@linaro.org, bing.zhu@intel.com,
 Matti.Moell@opensynergy.com, virtualization@lists.linuxfoundation.org,
 ilias.apalodimas@linaro.org, qemu-devel@nongnu.org, arnd@linaro.org,
 takahiro.akashi@linaro.org, tomas.winkler@intel.com,
 stratos-dev@op-lists.linaro.org, hmo@opensynergy.com, yang.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 25, 2020 at 01:51:43PM +0100, Alex Bennée wrote:
> With this command we are finally updating data to the backing store
> and cycling the write_count and each successful write. We also include
> the write count in all response frames as the spec is a little unclear
> but the example test code expected it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tools/vhost-user-rpmb/main.c | 111 +++++++++++++++++++++++++++++++++--
>  1 file changed, 105 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/vhost-user-rpmb/main.c b/tools/vhost-user-rpmb/main.c
> index 88747c50fa44..a17c3b4bcc4e 100644
> --- a/tools/vhost-user-rpmb/main.c
> +++ b/tools/vhost-user-rpmb/main.c
> @@ -62,6 +62,7 @@ enum {
>  #define KiB     (1UL << 10)
>  #define MAX_RPMB_SIZE (KiB * 128 * 256)
>  #define RPMB_KEY_MAC_SIZE 32
> +#define RPMB_BLOCK_SIZE 256
>  
>  /* RPMB Request Types */
>  #define VIRTIO_RPMB_REQ_PROGRAM_KEY        0x0001
> @@ -100,7 +101,7 @@ struct virtio_rpmb_config {
>  struct virtio_rpmb_frame {
>      uint8_t stuff[196];
>      uint8_t key_mac[RPMB_KEY_MAC_SIZE];
> -    uint8_t data[256];
> +    uint8_t data[RPMB_BLOCK_SIZE];
>      uint8_t nonce[16];
>      /* remaining fields are big-endian */
>      uint32_t write_counter;
> @@ -124,6 +125,7 @@ typedef struct VuRpmb {
>      uint8_t  last_nonce[16];
>      uint16_t last_result;
>      uint16_t last_reqresp;
> +    uint16_t last_address;
>      uint32_t write_count;
>  } VuRpmb;
>  
> @@ -239,17 +241,30 @@ vrpmb_set_config(VuDev *dev, const uint8_t *data,
>   * which itself uses a 3 clause BSD chunk of code.
>   */
>  
> +static const int rpmb_frame_dlen = (sizeof(struct virtio_rpmb_frame) -
> +                                    offsetof(struct virtio_rpmb_frame, data));
> +
>  static void vrpmb_update_mac_in_frame(VuRpmb *r, struct virtio_rpmb_frame *frm)
>  {
>      hmac_sha256_ctx ctx;
> -    static const int dlen = (sizeof(struct virtio_rpmb_frame) -
> -                             offsetof(struct virtio_rpmb_frame, data));
>  
>      hmac_sha256_init(&ctx, r->key, RPMB_KEY_MAC_SIZE);
> -    hmac_sha256_update(&ctx, frm->data, dlen);
> +    hmac_sha256_update(&ctx, frm->data, rpmb_frame_dlen);
>      hmac_sha256_final(&ctx, &frm->key_mac[0], 32);
>  }
>  
> +static bool vrpmb_verify_mac_in_frame(VuRpmb *r, struct virtio_rpmb_frame *frm)
> +{
> +    hmac_sha256_ctx ctx;
> +    uint8_t calculated_mac[RPMB_KEY_MAC_SIZE];
> +
> +    hmac_sha256_init(&ctx, r->key, RPMB_KEY_MAC_SIZE);
> +    hmac_sha256_update(&ctx, frm->data, rpmb_frame_dlen);
> +    hmac_sha256_final(&ctx, calculated_mac, RPMB_KEY_MAC_SIZE);
> +
> +    return memcmp(calculated_mac, frm->key_mac, RPMB_KEY_MAC_SIZE) == 0;
>
I'd prefer using a constant time comparison function for this one
instead of memcmp (regardless if it's used for simulation or not) to
prevent eventual timing attacks.

> +}
> +
>  /*
>   * Handlers for individual control messages
>   */
> @@ -324,6 +339,82 @@ vrpmb_handle_get_write_counter(VuDev *dev, struct virtio_rpmb_frame *frame)
>      return resp;
>  }
>  
> +/*
> + * vrpmb_handle_write:
> + *
> + * We will report the success/fail on receipt of
> + * VIRTIO_RPMB_REQ_RESULT_READ. Returns the number of extra frames
> + * processed in the request.
> + */
> +static int vrpmb_handle_write(VuDev *dev, struct virtio_rpmb_frame *frame)
> +{
> +    VuRpmb *r = container_of(dev, VuRpmb, dev.parent);
> +    int extra_frames = 0;
> +    uint16_t block_count = be16toh(frame->block_count);
> +    uint32_t write_counter = be32toh(frame->write_counter);
> +    size_t offset;
> +
> +    r->last_reqresp = VIRTIO_RPMB_RESP_DATA_WRITE;
> +    r->last_address = be16toh(frame->address);
> +    offset =  r->last_address * RPMB_BLOCK_SIZE;
> +
> +    /*
> +     * Run the checks from:
> +     * 5.12.6.1.3 Device Requirements: Device Operation: Data Write
> +     */
> +    if (!r->key) {
> +        g_warning("no key programmed");
> +        r->last_result = VIRTIO_RPMB_RES_NO_AUTH_KEY;
> +    } else if (block_count == 0 ||
> +               block_count > r->virtio_config.max_wr_cnt) {
> +        r->last_result = VIRTIO_RPMB_RES_GENERAL_FAILURE;
> +    } else if (false /* what does an expired write counter mean? */) {
>
IIRC, the counter has room for a 32-bit value and the counter will never
wrap around. So once the counter have reached max for uint32_t, then
there is an additional bit set (permanently) in the operation result.
I.e., writes are no longer possible once that has happened. That is
probably what you're referring to here I suppose.

> +        r->last_result = VIRTIO_RPMB_RES_WRITE_COUNTER_EXPIRED;
> +    } else if (offset > (r->virtio_config.capacity * (128 * KiB))) {
> +        r->last_result = VIRTIO_RPMB_RES_ADDR_FAILURE;
> +    } else if (!vrpmb_verify_mac_in_frame(r, frame)) {
> +        r->last_result = VIRTIO_RPMB_RES_AUTH_FAILURE;
> +    } else if (write_counter != r->write_count) {
> +        r->last_result = VIRTIO_RPMB_RES_COUNT_FAILURE;
> +    } else {
> +        int i;
> +        /* At this point we have a valid authenticated write request
> +         * so the counter can incremented and we can attempt to
> +         * update the backing device.
> +         */
> +        r->write_count++;
> +        for (i = 0; i < block_count; i++) {
> +            void *blk = r->flash_map + offset;
> +            g_debug("%s: writing block %d", __func__, i);
> +            if (mprotect(blk, RPMB_BLOCK_SIZE, PROT_WRITE) != 0) {
> +                r->last_result =  VIRTIO_RPMB_RES_WRITE_FAILURE;
> +                break;
> +            }
> +            memcpy(blk, frame[i].data, RPMB_BLOCK_SIZE);
> +            if (msync(blk, RPMB_BLOCK_SIZE, MS_SYNC) != 0) {
> +                g_warning("%s: failed to sync update", __func__);
> +                r->last_result = VIRTIO_RPMB_RES_WRITE_FAILURE;
> +                break;
> +            }
> +            if (mprotect(blk, RPMB_BLOCK_SIZE, PROT_READ) != 0) {
> +                g_warning("%s: failed to re-apply read protection", __func__);
> +                r->last_result = VIRTIO_RPMB_RES_GENERAL_FAILURE;
> +                break;
> +            }
> +            offset += RPMB_BLOCK_SIZE;
> +        }
> +        r->last_result = VIRTIO_RPMB_RES_OK;
> +        extra_frames = i - 1;
> +    }
> +
> +    g_info("%s: %s (%x, %d extra frames processed), write_count=%d", __func__,
> +           r->last_result == VIRTIO_RPMB_RES_OK ? "successful":"failed",
> +           r->last_result, extra_frames, r->write_count);
> +
> +    return extra_frames;
> +}
> +
> +
>  /*
>   * Return the result of the last message. This is only valid if the
>   * previous message was VIRTIO_RPMB_REQ_PROGRAM_KEY or
> @@ -339,10 +430,14 @@ static struct virtio_rpmb_frame * vrpmb_handle_result_read(VuDev *dev)
>      g_info("%s: for request:%x result:%x", __func__,
>             r->last_reqresp, r->last_result);
>  
> -    if (r->last_reqresp == VIRTIO_RPMB_RESP_PROGRAM_KEY ||
> -        r->last_reqresp == VIRTIO_RPMB_REQ_DATA_WRITE) {
> +    if (r->last_reqresp == VIRTIO_RPMB_RESP_PROGRAM_KEY) {
>          resp->result = htobe16(r->last_result);
>          resp->req_resp = htobe16(r->last_reqresp);
> +    } else if (r->last_reqresp == VIRTIO_RPMB_RESP_DATA_WRITE) {
> +        resp->result = htobe16(r->last_result);
> +        resp->req_resp = htobe16(r->last_reqresp);
> +        resp->write_counter = htobe32(r->write_count);
> +        resp->address = htobe16(r->last_address);
>      } else {
>          resp->result = htobe16(VIRTIO_RPMB_RES_GENERAL_FAILURE);
>      }
> @@ -445,6 +540,10 @@ vrpmb_handle_ctrl(VuDev *dev, int qidx)
>                                __func__);
>                  }
>                  break;
> +            case VIRTIO_RPMB_REQ_DATA_WRITE:
> +                /* we can have multiple blocks handled */
> +                n += vrpmb_handle_write(dev, f);
> +                break;
>              default:
>                  g_debug("un-handled request: %x", f->req_resp);
>                  break;
> -- 
> 2.20.1
> 

-- 
Regards,
Joakim

