Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF4275E5F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 19:11:28 +0200 (CEST)
Received: from localhost ([::1]:48338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL8Ih-0004HD-8R
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 13:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kL8GT-00035O-2F; Wed, 23 Sep 2020 13:09:09 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kL8GR-0007LI-8m; Wed, 23 Sep 2020 13:09:08 -0400
Received: from [192.168.100.1] ([82.252.129.222]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M4JVv-1kKr962W6T-000Kcd; Wed, 23 Sep 2020 19:08:57 +0200
Subject: Re: [PATCH] virtio: vdpa: omit check return of g_malloc
To: Laurent Vivier <lvivier@redhat.com>, Li Qiang <liq3ea@163.com>,
 mst@redhat.com, jasowang@redhat.com
References: <20200819144309.67579-1-liq3ea@163.com>
 <9e4f982e-2bd1-94f9-724e-6eada04d6096@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <09fd2c30-e086-8f01-aabc-358fde2eb2a7@vivier.eu>
Date: Wed, 23 Sep 2020 19:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9e4f982e-2bd1-94f9-724e-6eada04d6096@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hkaF7R+V+t9KKem+qw9yc4ARhEs96QxwKNw3hJVwQ4LnkS0yzpL
 VMjjalsUstie3mcBynnLj4t8YBtFXLwC8QajayXg41IBxFG7VPmhT7dgKsY5oWWfziCMq1K
 P3AUvN2wkShd0YktSgjUPBuaSHrxwhdMjiZ0vEAma+DLoZJymwpV3IIS5IJfCK4TN0Ry/ip
 9dD2MW8/8B/El+fbp/Asw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3QQUGof5nms=:orjQm51sWSSFSd80m0efVG
 J04MImp56d+iWt/RgDPO+MD8RlNe7Q0xMDzWomo/7Ws6xYja+dRUNaoAHTosadMGNpKbRZ0L8
 Rxi7xaJ3pGH4uYNTDfD0WpW9kcv1YsaA5IwbsPsTL0okoz6v+RW8WBfXI2O5Z9a+6R1r3Z1/6
 Psqd2i3WoI8FyvUIJhv0TEwq8Mup22yDCNvy189FMBaBvkDuFXpJkYNuR7UaosMsVGFU2D5xX
 dLTL7rfC0x16OVAwFcjmjSZt40IBZCGvWB2JQ43tL86WBKzyTl300QE3fBKc+H9VXmcAdJ58Y
 EORNP+8DjH9bKX8xSMKGZ/4qs9lpYr6Wk1+TMJP2wY4LOMj+Drm4MMLwNi3N0/F1UA+GI22Rf
 FZPgwn8csOP9wq/T6/39m4kKUZmEqK5Dt9ktFu0/8ggi9n/M81T+H5LpAOp4DJ6iCRrzcwayA
 I8pjpCq+afb0v/eSFnAoXMb/87Voa20H/ZUIwNlLYjQG6jZ/sivq9Tckx7Bmf7eTQqdeElMYp
 oX+/+Bt+kMQefNEOSYh1YsxCNK6twS4e6t164aK6llpraYhjzuRQMeVsmKWBnNT9QKdf8lS16
 Mqznj7qPanioEvQfRU1OYP+eZ56/N1wvE910WC3IxQTqzOEod8ks/Ope24XRR/FXvML2NK99O
 WPhn9qdjWDMczVaX0eNd37vQLQepVCZ/1jTTZLA617B6YJwq6ucqXSt1D74vaJB0WyuvQh9GU
 oMpsEZCUDLLJN1ITu6jM4B5r482NqQB+BJ5rB62eWAnf76XKFeqHWjM6XbC4fSSZPeAN1qf7y
 jMOUCTW6ToyOmKl6JI5Dw4Ec+4N5iYpz2QKXCiHTmelpxtuQb+8BUsMgM66qVHupDj0OCYN
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 13:09:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, liq3ea@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2020 à 14:53, Laurent Vivier a écrit :
> On 19/08/2020 16:43, Li Qiang wrote:
>> If g_malloc fails, the application will be terminated.
>> No need to check the return value of g_malloc.
>>
>> Signed-off-by: Li Qiang <liq3ea@163.com>
>> ---
>>  hw/virtio/vhost-vdpa.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 4580f3efd8..403ae3ae07 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -320,10 +320,8 @@ static int vhost_vdpa_set_config(struct vhost_dev *dev, const uint8_t *data,
>>      struct vhost_vdpa_config *config;
>>      int ret;
>>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
>> +
>>      config = g_malloc(size + config_size);
>> -    if (config == NULL) {
>> -        return -1;
>> -    }
>>      config->off = offset;
>>      config->len = size;
>>      memcpy(config->buf, data, size);
>> @@ -340,9 +338,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>>      int ret;
>>  
>>      v_config = g_malloc(config_len + config_size);
>> -    if (v_config == NULL) {
>> -        return -1;
>> -    }
>>      v_config->len = config_len;
>>      v_config->off = 0;
>>      ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_CONFIG, v_config);
>>
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


