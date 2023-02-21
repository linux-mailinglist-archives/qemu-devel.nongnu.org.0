Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4869E9F1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUaw1-00050F-Ko; Tue, 21 Feb 2023 17:16:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUavW-0004v3-5F
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:15:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUavS-0005PQ-Ah
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:15:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so2164728wmq.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QRgZuaa0vXJdPoob66/HKPmQifpcuWYDUWcuuHs414Y=;
 b=jk7Ihb/enxXw74fBYIr5jYy4B92cX63+ZqVMZPk4rIVtnlXh1XQqMWcXznwslsl0/i
 Dn11Ywyh/znNdxKQJdHQ8v355dFrjy2mtBkmwriEFOFSZg+sFdaDxO4npS4RgAHzLWKB
 JPKHtV8zlci0ZZkV13MDrG0UAFHnVpQJcpndUuMDXBUJGoejK2PPoZ6pXJvXG8Yy6tJe
 Y3mstwUETXUZ+TZ0/z7eV87xwON1N0tQzmvfk7ndxue8UpRF+0ovPY2tJCK7U/aufT/Y
 TXucutGdcKY+UZrEsYCtl1KtaE7+dSedEzaYU+ak0q7h9BJlKrNb9ixpTCRiwRv4f5Ys
 IxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QRgZuaa0vXJdPoob66/HKPmQifpcuWYDUWcuuHs414Y=;
 b=TyZeoiCav09pG617ING8UmqykRI9+J/utM051OrgAQRhVlTc+Sa5qbf4nYVkXC0zJR
 i8svk8eVAEFmUK3OoYfMDwOhDCL549H3etNKgnd5V3QM7l/l/XBe7hC3LxFCUdKeehVd
 CJvA8VGlAfYksi78yOoiVpvESifd4Zl+MBrE2MN37U68dB1EQ9BItoUcZ5IcAxZxOrnB
 HGwBfeTQhi1ZOhAZsseKQY4+JoMRlx26enlX4H5Co2dJSvsRF0wP/alvCdIB0j4nHTrq
 xDjVj/QDNUxsUuMR4PtDCtkXwjw/rVR3sq+rGZHk43M48MzH28I49kbkq79PNOhOBPbc
 Tyrg==
X-Gm-Message-State: AO0yUKXE2T6BsguvBkUtShSA9X8PYjiuGB5WqwBo/IcMR4ii1yunp0Cx
 PO5kPLYvIzzJFp5LpzrwLXATiA==
X-Google-Smtp-Source: AK7set9W0WsaJXl7EaRLxu1yfsdD2SdqVIDJ5e1ktAoPcPQerY4tOYNH/MMUtpAsepikxwV14B8SIQ==
X-Received: by 2002:a05:600c:130e:b0:3dc:5ab8:7d74 with SMTP id
 j14-20020a05600c130e00b003dc5ab87d74mr4539732wmf.3.1677017752104; 
 Tue, 21 Feb 2023 14:15:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bd9-20020a05600c1f0900b003e1202744f2sm14455810wmb.31.2023.02.21.14.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:15:51 -0800 (PST)
Message-ID: <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
Date: Tue, 21 Feb 2023 23:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Jonathan,

On 21/2/23 16:21, Jonathan Cameron wrote:
> CXL uses PCI AER Internal errors to signal to the host that an error has
> occurred. The host can then read more detailed status from the CXL RAS
> capability.
> 
> For uncorrectable errors: support multiple injection in one operation
> as this is needed to reliably test multiple header logging support in an
> OS. The equivalent feature doesn't exist for correctable errors, so only
> one error need be injected at a time.
> 
> Note:
>   - Header content needs to be manually specified in a fashion that
>     matches the specification for what can be in the header for each
>     error type.
> 
> Injection via QMP:
> { "execute": "qmp_capabilities" }
> ...
> { "execute": "cxl-inject-uncorrectable-errors",
>    "arguments": {
>      "path": "/machine/peripheral/cxl-pmem0",
>      "errors": [
>          {
>              "type": "cache-address-parity",
>              "header": [ 3, 4]
>          },
>          {
>              "type": "cache-data-parity",
>              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
>          },
>          {
>              "type": "internal",
>              "header": [ 1, 2, 4]
>          }
>          ]
>    }}
> ...
> { "execute": "cxl-inject-correctable-error",
>      "arguments": {
>          "path": "/machine/peripheral/cxl-pmem0",
>          "type": "physical"
>      } }
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v5: (Thanks to Dave Jiang for review)
> - Spell out Implementation Defined (previously typo as Imdef which did
>    not help)
> v4:
> - Improved QMP help text wth more detail (following request in review
>    of the Poison injection series)
> ---
>   hw/cxl/cxl-component-utils.c   |   4 +-
>   hw/mem/cxl_type3.c             | 281 +++++++++++++++++++++++++++++++++
>   hw/mem/cxl_type3_stubs.c       |  10 ++
>   hw/mem/meson.build             |   2 +
>   include/hw/cxl/cxl_component.h |  26 +++
>   include/hw/cxl/cxl_device.h    |  11 ++
>   qapi/cxl.json                  | 118 ++++++++++++++
>   qapi/meson.build               |   1 +
>   qapi/qapi-schema.json          |   1 +
>   9 files changed, 453 insertions(+), 1 deletion(-)


> diff --git a/hw/mem/cxl_type3_stubs.c b/hw/mem/cxl_type3_stubs.c
> new file mode 100644
> index 0000000000..b6b51ced54
> --- /dev/null
> +++ b/hw/mem/cxl_type3_stubs.c
> @@ -0,0 +1,10 @@
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-cxl.h"
> +
> +void qmp_cxl_inject_uncorrectable_errors(const char *path,
> +                                         CXLUncorErrorRecordList *errors,
> +                                         Error **errp) {

What about:

     error_setg(errp, "CLX support is not compiled in");

}
> +
> +void qmp_cxl_inject_correctable_error(const char *path, CxlCorErrorType type,
> +                                      Error **errp) {}

Ditto.


> diff --git a/qapi/cxl.json b/qapi/cxl.json
> new file mode 100644
> index 0000000000..ac7e167fa2
> --- /dev/null
> +++ b/qapi/cxl.json
> @@ -0,0 +1,118 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +
> +##
> +# = CXL devices
> +##
> +
> +##
> +# @CxlUncorErrorType:

Likely missing a "(since 8.0)" mention somewhere.

> +#
> +# Type of uncorrectable CXL error to inject. These errors are reported via
> +# an AER uncorrectable internal error with additional information logged at
> +# the CXL device.
> +#
> +# @cache-data-parity: Data error such as data parity or data ECC error CXL.cache
> +# @cache-address-parity: Address parity or other errors associated with the
> +#                        address field on CXL.cache
> +# @cache-be-parity: Byte enable parity or other byte enable errors on CXL.cache
> +# @cache-data-ecc: ECC error on CXL.cache
> +# @mem-data-parity: Data error such as data parity or data ECC error on CXL.mem
> +# @mem-address-parity: Address parity or other errors associated with the
> +#                      address field on CXL.mem
> +# @mem-be-parity: Byte enable parity or other byte enable errors on CXL.mem.
> +# @mem-data-ecc: Data ECC error on CXL.mem.
> +# @reinit-threshold: REINIT threshold hit.
> +# @rsvd-encoding: Received unrecognized encoding.
> +# @poison-received: Received poison from the peer.
> +# @receiver-overflow: Buffer overflows (first 3 bits of header log indicate which)
> +# @internal: Component specific error
> +# @cxl-ide-tx: Integrity and data encryption tx error.
> +# @cxl-ide-rx: Integrity and data encryption rx error.
> +##
> +
> +{ 'enum': 'CxlUncorErrorType',

Doesn't these need

      'if': 'CONFIG_CXL_MEM_DEVICE',

?

> +  'data': ['cache-data-parity',
> +           'cache-address-parity',
> +           'cache-be-parity',
> +           'cache-data-ecc',
> +           'mem-data-parity',
> +           'mem-address-parity',
> +           'mem-be-parity',
> +           'mem-data-ecc',
> +           'reinit-threshold',
> +           'rsvd-encoding',
> +           'poison-received',
> +           'receiver-overflow',
> +           'internal',
> +           'cxl-ide-tx',
> +           'cxl-ide-rx'
> +           ]
> + }
> +
> +##
> +# @CXLUncorErrorRecord:
> +#
> +# Record of a single error including header log.
> +#
> +# @type: Type of error
> +# @header: 16 DWORD of header.
> +##
> +{ 'struct': 'CXLUncorErrorRecord',
> +  'data': {
> +      'type': 'CxlUncorErrorType',
> +      'header': [ 'uint32' ]
> +  }
> +}
> +
> +##
> +# @cxl-inject-uncorrectable-errors:
> +#
> +# Command to allow injection of multiple errors in one go. This allows testing
> +# of multiple header log handling in the OS.
> +#
> +# @path: CXL Type 3 device canonical QOM path
> +# @errors: Errors to inject
> +##
> +{ 'command': 'cxl-inject-uncorrectable-errors',
> +  'data': { 'path': 'str',
> +             'errors': [ 'CXLUncorErrorRecord' ] }}
> +
> +##
> +# @CxlCorErrorType:
> +#
> +# Type of CXL correctable error to inject
> +#
> +# @cache-data-ecc: Data ECC error on CXL.cache
> +# @mem-data-ecc: Data ECC error on CXL.mem
> +# @crc-threshold: Component specific and applicable to 68 byte Flit mode only.
> +# @cache-poison-received: Received poison from a peer on CXL.cache.
> +# @mem-poison-received: Received poison from a peer on CXL.mem
> +# @physical: Received error indication from the physical layer.
> +##
> +{ 'enum': 'CxlCorErrorType',
> +  'data': ['cache-data-ecc',
> +           'mem-data-ecc',
> +           'crc-threshold',
> +           'retry-threshold',
> +           'cache-poison-received',
> +           'mem-poison-received',
> +           'physical']
> +}
> +
> +##
> +# @cxl-inject-correctable-error:
> +#
> +# Command to inject a single correctable error.  Multiple error injection
> +# of this error type is not interesting as there is no associated header log.
> +# These errors are reported via AER as a correctable internal error, with
> +# additional detail available from the CXL device.
> +#
> +# @path: CXL Type 3 device canonical QOM path
> +# @type: Type of error.
> +##
> +{ 'command': 'cxl-inject-correctable-error',
> +  'data': { 'path': 'str',
> +            'type': 'CxlCorErrorType'
> +  }
> +}

